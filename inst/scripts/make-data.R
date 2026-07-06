# inst/scripts/make-data.R
# This script prepares PACMOSData resources for ExperimentHub.
#
# The raw/ directory is used locally to generate final ExperimentHub resources.
#
# Expected local input files:
# raw/lungNEN_references/lungNENomics_MOFA_inputs.RData
# raw/MESOMICS_references/MESOMICS_MOFA_inputs.RData
# raw/lungNEN_references/*.csv/*.txt
# raw/MESOMICS_references/*.csv/*.txt
# raw/query_data/*.csv/*.txt

message("Creating eh-data directory...")
dir.create("eh-data", showWarnings = FALSE)

# ----------------------------
# Helper function
# ----------------------------

save_loaded_RData <- function(input_file, output_file) {
  if (!file.exists(input_file)) {
    stop("Input file does not exist: ", input_file)
  }

  message("Loading: ", input_file)

  tmp_env <- new.env(parent = emptyenv())
  loaded_objects <- load(input_file, envir = tmp_env)

  if (length(loaded_objects) == 0) {
    stop("No objects were loaded from: ", input_file)
  }

  message("Objects loaded: ", paste(loaded_objects, collapse = ", "))

  save(
    list = loaded_objects,
    file = output_file,
    envir = tmp_env,
    compress = "xz"
  )

  message("Saved: ", output_file)
}

# ----------------------------
# 1. lungNENomics MOFA inputs
# ----------------------------

save_loaded_RData(
  input_file = "raw/lungNEN_references/lungNENomics_MOFA_inputs.RData",
  output_file = "eh-data/lungNENomics_MOFA_inputs.RData"
)

# ----------------------------
# 2. MESOMICS MOFA inputs
# ----------------------------

save_loaded_RData(
  input_file = "raw/MESOMICS_references/MESOMICS_MOFA_inputs.RData",
  output_file = "eh-data/MESOMICS_MOFA_inputs.RData"
)

# ----------------------------
# 3. Copy CSV/TXT reference and query files
# ----------------------------

copy_reference_files <- function(from_dir, to_dir = "eh-data") {
  if (!dir.exists(from_dir)) {
    warning("Directory does not exist: ", from_dir)
    return(invisible(NULL))
  }

  files <- list.files(
    from_dir,
    pattern = "\\.(csv|txt)$",
    full.names = TRUE
  )

  if (length(files) == 0) {
    message("No CSV/TXT files found in: ", from_dir)
    return(invisible(NULL))
  }

  file.copy(
    from = files,
    to = to_dir,
    overwrite = TRUE
  )

  message("Copied files from: ", from_dir)
  message(paste(basename(files), collapse = ", "))
}

copy_reference_files("raw/lungNEN_references")
copy_reference_files("raw/MESOMICS_references")
copy_reference_files("raw/query_data")

# ----------------------------
# 4. Final checks
# ----------------------------

files <- list.files("eh-data", full.names = FALSE)

if (length(files) == 0) {
  stop("No files were created in eh-data.")
}

message("Final eh-data files:")
print(files)

# Check that RData files are non-empty
rdata_files <- list.files("eh-data", pattern = "\\.RData$", full.names = TRUE)

for (f in rdata_files) {
  check_env <- new.env(parent = emptyenv())
  loaded <- load(f, envir = check_env)

  if (length(loaded) == 0) {
    stop("RData file contains no objects: ", f)
  }

  message("Checked ", basename(f), ": ", paste(loaded, collapse = ", "))
}

message("make-data.R completed successfully.")
