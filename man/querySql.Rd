% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Sql.R
\name{querySql}
\alias{querySql}
\title{Retrieve data to a data.frame}
\usage{
querySql(
  connection,
  sql,
  errorReportFile = file.path(getwd(), "errorReportSql.txt"),
  snakeCaseToCamelCase = FALSE
)
}
\arguments{
\item{connection}{The connection to the database server.}

\item{sql}{The SQL to be send.}

\item{errorReportFile}{The file where an error report will be written if an error occurs. Defaults to
'errorReportSql.txt' in the current working directory.}

\item{snakeCaseToCamelCase}{If true, field names are assumed to use snake_case, and are converted to camelCase.}
}
\value{
A data frame.
}
\description{
This function sends SQL to the server, and returns the results.
}
\details{
This function sends the SQL to the server and retrieves the results. If an error occurs during SQL
execution, this error is written to a file to facilitate debugging. Null values in the database are converted
to NA values in R.
}
\examples{
\dontrun{
connectionDetails <- createConnectionDetails(dbms = "postgresql",
                                             server = "localhost",
                                             user = "root",
                                             password = "blah",
                                             schema = "cdm_v4")
conn <- connect(connectionDetails)
count <- querySql(conn, "SELECT COUNT(*) FROM person")
disconnect(conn)
}
}
