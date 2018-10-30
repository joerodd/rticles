#' JASA-EL journal format.
#'
#' Format for creating submissions to JASA express letters.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "interactapa_article", package = "rticles")
#' }
#'
#' @export
jasa_el_article <- function(...,
                             keep_tex = TRUE,
                             md_extensions = c("-autolink_bare_uris")) {
  inherit_pdf_document(...,
                       template = find_resource("jasa_el_article", "template.tex"),
                       keep_tex = keep_tex,
                       latex_engine = "xelatex",
                       citation_package = "natbib",
                       md_extensions = md_extensions)
}
