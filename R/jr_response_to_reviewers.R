#' Convert to a PDF/LaTeX document
#'
#' Formats for converting from R Markdown to a PDF or LaTeX document.
#'
#' See the \href{https://rmarkdown.rstudio.com/pdf_document_format.html}{online
#' documentation} for additional details on using the \code{pdf_document} format.
#'
#' Creating PDF output from R Markdown requires that LaTeX be installed.
#'
#' R Markdown documents can have optional metadata that is used to generate a
#' document header that includes the title, author, and date. For more details
#' see the documentation on R Markdown \link[=rmd_metadata]{metadata}.
#'
#' R Markdown documents also support citations. You can find more information on
#' the markdown syntax for citations in the
#' \href{https://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html}{Bibliographies
#' and Citations} article in the online documentation.
#'
#' Many aspects of the LaTeX template used to create PDF documents can be
#' customized using metadata. For example:
#'
#' \tabular{l}{
#' \code{---} \cr
#' \code{title: "Crop Analysis Q3 2013"} \cr
#' \code{fontsize: 11pt} \cr
#' \code{geometry: margin=1in} \cr
#' \code{---}
#' }
#'
#' Available metadata variables include:
#'
#' \describe{
#'    \item{\code{lang}}{Document language code (e.g. "es", "fr", "pt-BR")}
#'    \item{\code{fontsize}}{Font size (e.g. 10pt, 11pt, 12pt)}
#'    \item{\code{documentclass}}{LaTeX document class (e.g. article)}
#'    \item{\code{classoption}}{Option for \code{documentclass} (e.g. oneside); may be repeated}
#'    \item{\code{geometry}}{Options for geometry class (e.g. margin=1in); may be repeated}
#'    \item{\code{mainfont, sansfont, monofont, mathfont}}{Document fonts (works only with xelatex and lualatex, see the \code{latex_engine} option)}
#'    \item{\code{linkcolor, urlcolor, citecolor}}{Color for internal, external, and citation links (red, green, magenta, cyan, blue, black)}
#'    \item{\code{linestretch}}{Options for line spacing (e.g. 1, 1.5, 3)}
#' }
#' @inheritParams html_document
#' @param fig_crop \code{TRUE} to automatically apply the \code{pdfcrop} utility
#'   (if available) to pdf figures
#' @param dev Graphics device to use for figure output (defaults to pdf)
#' @param highlight Syntax highlighting style. Supported styles include
#'   "default", "tango", "pygments", "kate", "monochrome", "espresso",
#'   "zenburn", and "haddock". Pass \code{NULL} to prevent syntax highlighting.
#' @param keep_tex Keep the intermediate tex file used in the conversion to PDF
#' @param latex_engine LaTeX engine for producing PDF output. Options are
#'   "pdflatex", "lualatex", and "xelatex".
#' @param citation_package The LaTeX package to process citations, \code{natbib}
#'   or \code{biblatex}. Use \code{none} if neither package is to be used.
#' @param template Pandoc template to use for rendering. Pass "default" to use
#'   the rmarkdown package default template; pass \code{NULL} to use pandoc's
#'   built-in template; pass a path to use a custom template that you've
#'   created.  See the documentation on
#'   \href{http://pandoc.org/README.html}{pandoc online documentation}
#'   for details on creating custom templates.
#' @param extra_dependencies A LaTeX dependency \code{latex_dependency()}, a
#'   list of LaTeX dependencies, a character vector of LaTeX package names (e.g.
#'   \code{c("framed", "hyperref")}), or a named list of LaTeX package options
#'   with the names being package names (e.g. \code{list(hypreref =
#'   c("unicode=true", "breaklinks=true"), lmodern = NULL)}). It can be used to
#'   add custom LaTeX packages to the .tex header.
#' @return R Markdown output format to pass to \code{\link{render}}
#' @examples
#' \dontrun{
#' library(rmarkdown)
#'
#' # simple invocation
#' render("input.Rmd", pdf_document())
#'
#' # specify an option for latex engine
#' render("input.Rmd", pdf_document(latex_engine = "lualatex"))
#'
#' # add a table of contents and pass an option to pandoc
#' render("input.Rmd", pdf_document(toc = TRUE, "--listings"))
#' }
#' @export
jr_response_to_reviewers <- function(...,
                         latex_engine = "xelatex",
                         keep_tex = TRUE,
                         md_extensions = c("-autolink_bare_uris")) {

  inherit_pdf_document(...,
                       template = find_resource("jr_response_to_reviewers", "default-1.17.0.2.tex"),
                       keep_tex = keep_tex,
                       latex_engine = "xelatex",
                       citation_package = "biblatex",
                       md_extensions = md_extensions)
}
