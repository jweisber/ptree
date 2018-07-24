#' A Probability Tree Plotter
#'
#' Draw a probability tree using ggplot2
#' @param nodes
#' @keywords x, y, angle, segment, line segment
#' @export
#' @examples
#' draw_tree(nodes)

draw_tree <- function(nodes, padding = unit(.75, "lines"), leaf_p_fontface = "bold") {

  if (class(padding) == "numeric") {
    padding <- unit(padding, "lines")
  }

  p <- ggplot(nodes) +
    geom_segment(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_label(aes(x = x, y = y, label = text), label.size = NA, label.padding = padding) +
    theme_void() + ylim(0, 1)

  if ("p" %in% colnames(nodes)) {
    p <- p + geom_text(aes(x = p_x, y = p_y, label = p, angle = p_angle))
  }

  if ("leaf_p" %in% colnames(nodes)) {
    leaves <- nodes[nodes$tier == max(nodes$tier), ]
    leaves$leaf_p[is.na(leaves$leaf_p)] <- ""
    p <- p + geom_text(aes(x = leaf_p_x, y = leaf_p_y, label = leaf_p),
                       data = leaves, fontface = leaf_p_fontface) +
         xlim(0, 1.2)
  } else {
    p <- p + xlim(0, 1)
  }

  return(p)
}

