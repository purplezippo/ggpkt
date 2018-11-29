#' CPI data of prices for medical treatment
#'
#' A dataset containing the CPI value of medical treatment prices and other
#' attributes.
#'
#' @format A data frame with 376 rows and 6 variables:
#' \describe{
#'   \item{time}{Time stamp of int}
#'   \item{medi_type}{Way of treatment, with two types: '17', in clinic; 'q8',
#'     in hospital}
#'   \item{cpi}{Value of cpi(>1)}
#'   \item{drug}{The drug factor which influence the value of cpi, in comparison
#'     with material and treatment}
#'   \item{material}{The material factor which influence the value of cpi.}
#'   \item{treatment}{The treatment factor which influence the value of cpi.}
#' }
"medical_cpi"