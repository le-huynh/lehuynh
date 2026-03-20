# Plot network using NetworkD3

This function processes the input data to create an igraph object and
then generates an interactive network plot based on the specified plot
type. The plot can show the entire network, the largest component with a
single color, or the largest component with different colors based on
community detection. Node size and edge width are scaled based on node
degree and edge weight, respectively.

## Usage

``` r
plot_networkD3(
  data,
  col1 = "word1",
  col2 = "word2",
  plot_type = c("whole_network", "biggest_component_one_color",
    "biggest_component_community_color"),
  threshold,
  node_size = 20,
  edges_width = 10,
  opacity = 1,
  font_size = 15,
  ...
)
```

## Arguments

- data:

  A data frame containing the edge list for the network.

- col1, col2:

  The name of two columns containing the symbolic edge list. Default is
  "word1" and "word2", respectively.

- plot_type:

  A character string specifying the type of plot to generate. Options
  are "whole_network", "biggest_component_one_color", and
  "biggest_component_community_color". Default is "whole_network".

- threshold:

  An integer specifying the minimum frequency of edges to be included in
  the network.

- node_size:

  A numeric value specifying the base size of the nodes. Default is 20.

- edges_width:

  A numeric value specifying the base width of the edges. Default is 10.

- opacity:

  A numeric value specifying the opacity of the graph elements. Default
  is 1.

- font_size:

  A numeric value specifying the font size of the node labels. Default
  is 15.

- ...:

  Additional arguments passed to
  [`networkD3::forceNetwork()`](https://rdrr.io/pkg/networkD3/man/forceNetwork.html).

## Value

An interactive network plot created using `networkD3`.

## Examples

``` r
library(janeaustenr)

data <- austen_books() %>%
          ngrams_filter(group_column = "book",
                        group_name = "Pride & Prejudice",
                        text_column = "text",
                        ngrams = 2)

# The whole network plot
plot_networkD3(data = data,
               threshold = 10)

{"x":{"links":{"source":[1,1,1,3,0,3,0,1,1,4,1,6,5,5,8,0,1,7,2],"target":[11,10,22,13,9,9,21,14,3,15,15,15,18,16,20,17,17,19,12],"value":[10,7.701149425287356,5.977011494252874,4.022988505747127,3.67816091954023,3.67816091954023,2.758620689655173,2.64367816091954,2.64367816091954,2.413793103448276,2.183908045977012,2.068965517241379,1.954022988505747,1.954022988505747,1.724137931034483,1.609195402298851,1.494252873563219,1.494252873563219,1.379310344827586],"colour":["#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666"]},"nodes":{"name":["lady","miss","sir","de","cried","colonel","replied","thousand","dear","catherine","bingley","bennet","william","bourgh","darcy","elizabeth","forster","lucas","fitzwilliam","pounds","lizzy","catherine's","bingley's"],"group":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],"nodesize":[60,140,20,60,20,40,20,20,20,40,20,20,20,20,20,60,20,40,20,20,20,20,20]},"options":{"NodeID":"name","Group":"Group","colourScale":"d3.scaleOrdinal(d3.schemeCategory20);","fontSize":15,"fontFamily":"serif","clickTextSize":37.5,"linkDistance":50,"linkWidth":"function(d) { return Math.sqrt(d.value); }","charge":-30,"opacity":1,"zoom":false,"legend":false,"arrows":false,"nodesize":true,"radiusCalculation":" Math.sqrt(d.nodesize)+6","bounded":false,"opacityNoHover":1,"clickAction":null}},"evals":[],"jsHooks":[]}
# The biggest component plot with one color
plot_networkD3(data = data,
               plot_type = "biggest_component_one_color",
               threshold = 10)

{"x":{"links":{"source":[1,1,1,2,2,0,0,1,1,3,4,1,1,0],"target":[7,6,13,8,5,5,12,9,2,10,10,10,11,11],"value":[10,7.701149425287356,5.977011494252874,3.67816091954023,3.67816091954023,2.758620689655173,2.64367816091954,2.183908045977012,2.068965517241379,1.954022988505747,1.609195402298851,1.494252873563219,1.494252873563219,1.379310344827586],"colour":["#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666"]},"nodes":{"name":["lady","miss","de","cried","replied","catherine","bingley","bennet","bourgh","darcy","elizabeth","lucas","catherine's","bingley's"],"group":[1,1,1,1,1,1,1,1,1,1,1,1,1,1],"nodesize":[60,140,60,20,20,40,20,20,20,20,60,40,20,20]},"options":{"NodeID":"name","Group":"Group","colourScale":"d3.scaleOrdinal(d3.schemeCategory20);","fontSize":15,"fontFamily":"serif","clickTextSize":37.5,"linkDistance":50,"linkWidth":"function(d) { return Math.sqrt(d.value); }","charge":-30,"opacity":1,"zoom":false,"legend":false,"arrows":false,"nodesize":true,"radiusCalculation":" Math.sqrt(d.nodesize)+6","bounded":false,"opacityNoHover":1,"clickAction":null}},"evals":[],"jsHooks":[]}
# The biggest component plot with community based color
plot_networkD3(data = data,
               plot_type = "biggest_component_community_color",
               threshold = 10)

{"x":{"links":{"source":[1,1,1,2,2,0,0,1,1,3,4,1,1,0],"target":[7,6,13,8,5,5,12,9,2,10,10,10,11,11],"value":[10,7.701149425287356,5.977011494252874,3.67816091954023,3.67816091954023,2.758620689655173,2.64367816091954,2.183908045977012,2.068965517241379,1.954022988505747,1.609195402298851,1.494252873563219,1.494252873563219,1.379310344827586],"colour":["#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666","#666"]},"nodes":{"name":["lady","miss","de","cried","replied","catherine","bingley","bennet","bourgh","darcy","elizabeth","lucas","catherine's","bingley's"],"group":[1,2,3,4,4,1,2,2,3,2,4,1,1,2],"nodesize":[60,140,60,20,20,40,20,20,20,20,60,40,20,20]},"options":{"NodeID":"name","Group":"Group","colourScale":"d3.scaleOrdinal(d3.schemeCategory20);","fontSize":15,"fontFamily":"serif","clickTextSize":37.5,"linkDistance":50,"linkWidth":"function(d) { return Math.sqrt(d.value); }","charge":-30,"opacity":1,"zoom":false,"legend":false,"arrows":false,"nodesize":true,"radiusCalculation":" Math.sqrt(d.nodesize)+6","bounded":false,"opacityNoHover":1,"clickAction":null}},"evals":[],"jsHooks":[]}
```
