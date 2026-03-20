# Filter and generate N-Grams from text data

Filter a dataset based on a specified column and group value, generate
n-grams from a specified text column, then remove standard and
user-defined stopwords from the n-grams.

## Usage

``` r
ngrams_filter(
  data,
  group_column,
  group_name,
  text_column,
  ngrams,
  user_defined_stopwords = NULL
)
```

## Arguments

- data:

  A data frame containing the dataset to be processed.

- group_column:

  A character string specifying the name of the column used to filter
  the data.

- group_name:

  A character string specifying the value within the group column to
  filter the data by.

- text_column:

  A character string specifying the name of the column containing text
  data to be tokenized into n-grams.

- ngrams:

  An integer specifying the number of words in the n-grams to be
  generated.

- user_defined_stopwords:

  A character vector of additional stopwords to be removed from the
  n-grams. Default is NULL.

## Value

A data frame with the filtered data and generated n-grams, excluding the
specified stopwords.

## Examples

``` r
library(janeaustenr)

austen_books() %>%
          ngrams_filter(group_column = "book",
                        group_name = "Pride & Prejudice",
                        text_column = "text",
                        ngrams = 2)
#> # A tibble: 6,279 × 4
#>    text                                                        book  word1 word2
#>    <chr>                                                       <fct> <chr> <chr>
#>  1 "By Jane Austen"                                            Prid… jane  aust…
#>  2 "Chapter 1"                                                 Prid… chap… 1    
#>  3 "It is a truth universally acknowledged, that a single man… Prid… truth univ…
#>  4 "It is a truth universally acknowledged, that a single man… Prid… univ… ackn…
#>  5 "of the surrounding families, that he is considered the ri… Prid… surr… fami…
#>  6 "of the surrounding families, that he is considered the ri… Prid… righ… prop…
#>  7 "Netherfield Park is let at last?\""                        Prid… neth… park 
#>  8 "Mr. Bennet replied that he had not."                       Prid… benn… repl…
#>  9 "\"Do you not want to know who has taken it?\" cried his w… Prid… wife  impa…
#> 10 "delighted with it, that he agreed with Mr. Morris immedia… Prid… morr… imme…
#> # ℹ 6,269 more rows

austen_books() %>%
          ngrams_filter(group_column = "book",
                        group_name = "Pride & Prejudice",
                        text_column = "text",
                        ngrams = 2,
                        user_defined_stopwords = c("chapter", 1:50))
#> # A tibble: 6,216 × 4
#>    text                                                        book  word1 word2
#>    <chr>                                                       <fct> <chr> <chr>
#>  1 "By Jane Austen"                                            Prid… jane  aust…
#>  2 "It is a truth universally acknowledged, that a single man… Prid… truth univ…
#>  3 "It is a truth universally acknowledged, that a single man… Prid… univ… ackn…
#>  4 "of the surrounding families, that he is considered the ri… Prid… surr… fami…
#>  5 "of the surrounding families, that he is considered the ri… Prid… righ… prop…
#>  6 "Netherfield Park is let at last?\""                        Prid… neth… park 
#>  7 "Mr. Bennet replied that he had not."                       Prid… benn… repl…
#>  8 "\"Do you not want to know who has taken it?\" cried his w… Prid… wife  impa…
#>  9 "delighted with it, that he agreed with Mr. Morris immedia… Prid… morr… imme…
#> 10 "\"My dear Mr. Bennet,\" replied his wife, \"how can you b… Prid… benn… repl…
#> # ℹ 6,206 more rows
```
