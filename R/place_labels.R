#' A Segment-Label Placer
#'
#' Compute the coordinates and angle each line segment's label/probability
#' @param nodes
#' @keywords x, y, angle, segment, line segment
#' @export
#' @examples
#' place_labels(nodes, .05, 1.4)

place_labels <- function(nodes, y_nudge, aspect_ratio) {
  nodes$p_x <- midpoint(nodes$x, nodes$xend)
  nodes$p_y <- midpoint(nodes$y, nodes$yend) + y_nudge

  dx <- nodes$x - nodes$xend
  dy <- nodes$y - nodes$yend
  nodes$p_angle <- atan2(dy, dx) * 180 / pi / aspect_ratio

  return(nodes)
}
