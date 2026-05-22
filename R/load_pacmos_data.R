#' Load PACMOSData resources by dataset
#'
#' @param dataset One of `"MESOMICS"`, `"lungNENomics"`, or `"test"`.
#'
#' @return A named list of PACMOSData resources.
#' @export
load_pacmos_data <- function(dataset = c("MESOMICS", "lungNENomics", "test")) {
  dataset <- match.arg(dataset)

  selected_titles <- switch(
    dataset,
    MESOMICS = c(
      "archetypes",
      "D_alt_MOFA",
      "D_cnv_MOFA",
      "D_exprB_MOFA",
      "D_loh_MOFA",
      "D_met.bodB_MOFA",
      "D_met.enhB_MOFA",
      "D_met.proB_MOFA",
      "MESOMICS_latent_factors"
    ),
    lungNENomics = c(
      "Inputs_MOFA",
      "lungNEN_LF_K4_with_label",
      "lungNEN_LF_K4_without_label",
      "lungNEN_LFs",
      "lungNEN_sample_label"
    ),
    test = c(
      "lungNEN_test_expr",
      "MESOMICS_test_expr"
    )
  )

  eh <- ExperimentHub::ExperimentHub()
  q <- AnnotationHub::query(eh, "PACMOSData")

  if (length(q) == 0) {
    stop(
      "PACMOSData resources are not available in ExperimentHub yet. ",
      "This package must be submitted to Bioconductor and the data files ",
      "must be uploaded to ExperimentHub storage before this function works.",
      call. = FALSE
    )
  }

  keep <- q$title %in% selected_titles
  q <- q[keep]

  out <- lapply(seq_along(q), function(i) q[[i]])
  names(out) <- q$title
  out
}
