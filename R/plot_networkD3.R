
#' Plot network using NetworkD3
#'
#' This function processes the input data to create an igraph object and
#' then generates an interactive network plot based on the specified plot type.
#' The plot can show the entire network, the largest component with a single
#' color, or the largest component with different colors based on
#' community detection.
#' Node size and edge width are scaled based on node degree and edge weight,
#' respectively.
#'
#' @param data A data frame containing the edge list for the network.
#' @param col1,col2 The name of two columns containing the symbolic edge list.
#'        Default is "word1" and "word2", respectively.
#' @param plot_type A character string specifying the type of plot to generate.
#'        Options are "whole_network", "biggest_component_one_color",
#'        and "biggest_component_community_color". Default is "whole_network".
#' @param threshold An integer specifying the minimum frequency of edges
#'        to be included in the network.
#' @param node_size A numeric value specifying the base size of the nodes.
#'        Default is 20.
#' @param edges_width A numeric value specifying the base width of the edges.
#'        Default is 10.
#' @param opacity A numeric value specifying the opacity of the graph elements.
#'        Default is 1.
#' @param font_size A numeric value specifying the font size of the node labels.
#'        Default is 15.
#' @param ... Additional arguments passed to [networkD3::forceNetwork()].
#'
#' @return An interactive network plot created using `networkD3`.
#'
#' @export
#'
#' @example inst/examples/ex-plot_networkD3.R


plot_networkD3 <- function(data,
                           col1 = "word1",
                           col2 = "word2",
                           plot_type = c("whole_network",
                                         "biggest_component_one_color",
                                         "biggest_component_community_color"),
                           threshold,
                           node_size = 20,
                           edges_width = 10,
                           opacity = 1,
                           font_size = 15,
                           ...){

          data <- data %>%
                    dplyr::rename(word1 = col1,
                                  word2 = col2)

          network_init <- data %>%
                    dplyr::count(word1, word2, sort = TRUE) %>%
                    dplyr::filter(n > threshold) %>%
                    igraph::graph_from_data_frame(directed = FALSE)

          plot_type <- match.arg(plot_type)

          if (plot_type == "whole_network") {

                    network <- network_init
          }

          if (plot_type == "biggest_component_one_color") {

                    network <- igraph::largest_component(network_init)
          }

          if (plot_type == "biggest_component_community_color") {

                    network <- igraph::largest_component(network_init)

                    community <- igraph::cluster_louvain(
                              graph = network,
                              weights = igraph::E(network)$n)

                    # encode the membership as a node attribute
                    igraph::V(network)$membership <- igraph::membership(community)
          }

          # degree
          igraph::V(network)$degree <- igraph::strength(graph = network)

          # weight shares
          igraph::E(network)$width <- igraph::E(network)$n/max(igraph::E(network)$n)

          # create networkD3 object
          networkD3 <- networkD3::igraph_to_networkD3(g = network)

          # node size
          networkD3$nodes$Degree <- node_size*igraph::V(network)$degree

          # edges width
          networkD3$links$Width <- edges_width*igraph::E(network)$width


          if (plot_type %in% c("whole_network",
                               "biggest_component_one_color")) {
                    # color group
                    networkD3$nodes$Group <- 1
          }

          if (plot_type == "biggest_component_community_color") {
                    # color group
                    networkD3$nodes$Group <- igraph::V(network)$membership
          }

          fig <- networkD3::forceNetwork(
                    Links = networkD3$links,
                    Nodes = networkD3$nodes,
                    Source = 'source',
                    Target = 'target',
                    NodeID = 'name',
                    Group = 'Group',
                    opacity = opacity,
                    Value = 'Width',
                    Nodesize = 'Degree',
                    linkWidth = networkD3::JS("function(d) { return Math.sqrt(d.value); }"),
                    fontSize = font_size,
                    opacityNoHover = 1,
                    arrows = FALSE,
                    ...)

          return(fig)

}














