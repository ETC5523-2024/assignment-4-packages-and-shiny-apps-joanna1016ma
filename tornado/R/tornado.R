#' Tornado
#'
#' A dataset that contains the tornadoes and their characteristics in United States in 1950-2022.
#'
#' @format A data frame with 68,693 rows and 27 variables.
#' \describe{
#'   \item{om}{Tornado number. Effectively an ID for this tornado in this year.}
#'   \item{yr}{Year, 1950-2022.}
#'   \item{mo}{Month, 1-12.}
#'   \item{dy}{Day of the month, 1-31.}
#'   \item{date}{Date.}
#'   \item{time}{Time.}
#'   \item{tz}{Canonical tz database timezone.}
#'   \item{datetime_utc }{Date and time normalized to UTC.}
#'   \item{st}{Two-letter postal abbreviation for the state (DC = Washington, DC; PR = Puerto Rico; VI = Virgin Islands).}
#'   \item{stf}{State FIPS (Federal Information Processing Standards) number.}
#'   \item{mag}{Magnitude on the F scale (EF beginning in 2007). Some of these values are estimated (see fc).}
#'   \item{inj}{Number of injuries. When summing for state totals, use sn == 1}
#'   \item{fat}{Number of fatalities. When summing for state totals, use sn == 1}
#'   \item{loss}{Estimated property loss information in dollars. Prior to 1996, values were grouped into ranges. The reported number for such years is the maximum of its range.}
#'   \item{slat}{Starting latitude in decimal degrees.}
#'   \item{slon}{Starting longitude in decimal degrees.}
#'   \item{elat}{Ending latitude in decimal degrees.}
#'   \item{elon}{Ending longitude in decimal degrees.}
#'   \item{len}{ Length in miles.}
#'   \item{wid}{Width in yards.}
#'   \item{ns}{Number of states affected by this tornado. 1, 2, or 3.}
#'   \item{sn}{State number for this row. 1 means the row contains the entire track information for this state, 0 means there is at least one more entry for this state for this tornado (om + yr).}
#'   \item{f1}{FIPS code for the 1st county.}
#'   \item{f2}{FIPS code for the 2nd county.}
#'   \item{f3}{FIPS code for the 3rd county.}
#'   \item{f4}{FIPS code for the 4th county.}
#'   \item{fc}{Was the mag column estimated?}
#' }
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2023/2023-05-16/tornados.csv}
"tornados"
