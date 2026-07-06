#' Load PACMOSData resources by dataset
#'
#' @param dataset One of `"MESOMICS"`, `"lungNENomics"`, or `"query"`.
#'
#' @return A named list of PACMOSData resources.
#'
#' @examples
#' library(PACMOSData)
#'
#' mesomics <- load_pacmos_data("MESOMICS")
#' lungnen <- load_pacmos_data("lungNENomics")
#' query <- load_pacmos_data("query")
#'
#'
#' @export
#' @importFrom ExperimentHub ExperimentHub
#' @importFrom AnnotationHub query
load_pacmos_data <- function(dataset = c("MESOMICS", "lungNENomics", "query")) {
  dataset <- match.arg(dataset)

  selected_titles <- switch(
    dataset,
    MESOMICS = c(
      "MESOMICS_archetypes",
      "MESOMICS_MOFA_inputs",
      "MESOMICS_latent_factors"
    ),
    lungNENomics = c(
      "Inputs_MOFA",
      "lungNENomics_archetypes_with_label",
      "lungNEN_latent_factors",
      "lungNEN_sample_label"
    ),
    test = c(
      "lungNEN_query_expr",
      "MESOMICS_query_expr"
    )
  )

  eh <- ExperimentHub::ExperimentHub()
  q <- AnnotationHub::query(eh, "PACMOSData")

  if (length(q) == 0) {
    warning(
      "PACMOSData resources are not available in ExperimentHub yet. ",
      "This package must be submitted to Bioconductor and the data files ",
      "must be uploaded to ExperimentHub storage before this function works.",
      call. = FALSE
    )
    return(list())

  }

  keep <- q$title %in% selected_titles
  q <- q[keep]

  out <- lapply(seq_along(q), function(i) q[[i]])
  names(out) <- q$title
  out
}
