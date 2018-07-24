#' A Vertical Flipper
#'
#' Flip the tree vertically, to reverse the vertical order of nodes
#' @param nodes
#' @param y_nudge
#' @keywords y, flip, vertical
#' @export
#' @examples
#' flip_vertical(nodes, .025)

flip_vertical <- function(nodes, y_nudge) {
  nodes$y <- 1 - nodes$y
  nodes$yend <- 1 - nodes$yend
  nodes$p_y <- 1 - nodes$p_y
  nodes$p_y <- nodes$p_y + 2 * y_nudge
  nodes$p_angle <- -1 * nodes$p_angle
  nodes$leaf_p_y <- 1 - nodes$leaf_p_y

  return(nodes)
}
