library(janeaustenr)

data <- austen_books() %>%
          ngrams_filter(group_column = "book",
                        group_name = "Pride & Prejudice",
                        text_column = "text",
                        ngrams = 2)

# The whole network plot
plot_networkD3(data = data,
               threshold = 10)

# The biggest component plot with one color
plot_networkD3(data = data,
               plot_type = "biggest_component_one_color",
               threshold = 10)

# The biggest component plot with community based color
plot_networkD3(data = data,
               plot_type = "biggest_component_community_color",
               threshold = 10)

