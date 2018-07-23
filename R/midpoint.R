#' A Midpoint Function
#'
#' Compute the midpoints between the corresponding elements of x1 and x2
#' @param x1
#' @param x2
#' @keywords midpoint
#' @export
#' @examples
#' midpoint(c(1, 2), c(3, 4))

midpoint <- function(x1, x2) {
  df <- cbind(x1, x2)
  a <- apply(df, 1, min)
  b <- apply(df, 1, max)
  a + (b - a) / 2
}
