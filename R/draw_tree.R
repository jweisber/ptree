#' A Probability Tree Plotter
#'
#' Draw a probability tree using ggplot2
#' @param nodes
#' @keywords x, y, angle, segment, line segment
#' @export
#' @examples
#' draw_tree(nodes)

draw_tree <- function(nodes, padding = unit(.75, "lines")) {

  if (class(padding) == "numeric") {
    padding <- unit(padding, "lines")
  }

  p <- ggplot(nodes) +
    theme_void() + xlim(0, 1) + ylim(0, 1) +
    geom_segment(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_label(aes(x = x, y = y, label = text), label.size = NA, label.padding = padding)

  if ("p" %in% colnames(nodes)) {
    p <- p + geom_text(aes(x = p_x, y = p_y, label = p, angle = p_angle))
  }

  return(p)
}

