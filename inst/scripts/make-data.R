# inst/scripts/make-data.R
# This script prepares PACMOSData resources for ExperimentHub.

dir.create("eh-data", showWarnings = FALSE)

# 1. lungNEN MOFA input
load("raw/lungNEN_references/Inputs_MOFA.RData")
save(
  list = ls(),
  file = "eh-data/Inputs_MOFA.rda",
  compress = "xz"
)

rm(list = ls())

# 2. MESOMICS MOFA data files
mofa_files <- list.files(
  "raw/MESOMICS_references",
  pattern = "_MOFA\\.RData$",
  full.names = TRUE
)

for (f in mofa_files) {
  load(f)
  object_names <- ls()

  out_name <- sub("\\.RData$", ".rda", basename(f))

  save(
    list = object_names,
    file = file.path("eh-data", out_name),
    compress = "xz"
  )

  rm(list = object_names)
}

# 3. CSV/TXT reference files
file.copy(
  from = list.files("raw/lungNEN_references", pattern = "\\.(csv|txt)$", full.names = TRUE),
  to = "eh-data",
  overwrite = TRUE
)

file.copy(
  from = list.files("raw/MESOMICS_references", pattern = "\\.(csv|txt)$", full.names = TRUE),
  to = "eh-data",
  overwrite = TRUE
)

file.copy(
  from = list.files("raw/test_data", pattern = "\\.(csv|txt)$", full.names = TRUE),
  to = "eh-data",
  overwrite = TRUE
)
