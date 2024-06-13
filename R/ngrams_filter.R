
#' Filter and generate N-Grams from text data
#'
#' Filter a dataset based on a specified column and group value,
#' generate n-grams from a specified text column,
#' then remove standard and user-defined stopwords from the n-grams.
#'
#' @param data A data frame containing the dataset to be processed.
#' @param group_column A character string specifying the name of the column
#'        used to filter the data.
#' @param group_name A character string specifying the value within
#'        the group column to filter the data by.
#' @param text_column A character string specifying the name of the column
#'        containing text data to be tokenized into n-grams.
#' @param ngrams An integer specifying the number of words in the n-grams
#'        to be generated.
#' @param user_defined_stopwords A character vector of additional stopwords
#'        to be removed from the n-grams. Default is NULL.
#'
#' @return A data frame with the filtered data and generated n-grams,
#'        excluding the specified stopwords.
#'
#' @export
#'
#' @examples
#'
#' library(janeaustenr)
#'
#' austen_books() %>%
#'           ngrams_filter(group_column = "book",
#'                         group_name = "Pride & Prejudice",
#'                         text_column = "text",
#'                         ngrams = 2)
#'
#' austen_books() %>%
#'           ngrams_filter(group_column = "book",
#'                         group_name = "Pride & Prejudice",
#'                         text_column = "text",
#'                         ngrams = 2,
#'                         user_defined_stopwords = c("chapter", 1:50))


ngrams_filter <- function(data,
                          group_column,
                          group_name,
                          text_column,
                          ngrams,
                          user_defined_stopwords = NULL){

  df <- data %>%
            dplyr::filter(dplyr::if_all(group_column,
                                        ~ . == group_name)) %>%
            tidytext::unnest_tokens(output = ngrams_word,
                                    input = text_column,
                                    token = "ngrams",
                                    n = ngrams) %>%
            dplyr::filter(!is.na(ngrams_word)) %>%
            tidyr::separate(col = ngrams_word,
                            into = paste0("word", 1:ngrams),
                            sep = " ") %>%
            dplyr::filter(dplyr::if_all(paste0("word", 1:ngrams),
                                        ~ !(. %in% c(tidytext::stop_words$word,
                                                     user_defined_stopwords))))

          return(df)
}

