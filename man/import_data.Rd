% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import_data.R
\name{import_data}
\alias{import_data}
\title{Import .csv or .rds objects}
\usage{
import_data(
  file_path,
  data_type = c("csv", "rds"),
  output = c("list", "object"),
  input_pattern = NULL,
  remove_pattern = "NULL"
)
}
\arguments{
\item{file_path}{a character vector of full path names.}

\item{data_type}{type of imported objects, \code{csv} or \code{rds}.}

\item{output}{type of output, \code{list} or \code{object}.}

\item{input_pattern}{an optional regular expression. Only file names
which match the regular expression will be returned.}

\item{remove_pattern}{an optional regular expression.
Remove the matching regular expression in file names.}
}
\value{
\itemize{
\item \code{output = "list"}, a \emph{named} \code{list} of imported objects
\item \code{output = "object"}, multiple objects in the .GlobalEnv
}
}
\description{
This function imports multiple \code{.csv} or \code{.rds} objects
from a given folder.
}
\examples{
\dontrun{
path <- here::here("data/raw")

mydata <- import_data(file_path = path,
                      data_type = "csv",
                      output = "list",
                      input_pattern = "pc_gene",
                      remove_pattern = "gene")

import_data(file_path = path,
            data_type = "csv",
            output = "object",
            input_pattern = "pc_gene",
            remove_pattern = "gene")
}
}
