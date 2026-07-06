# inst/scripts/make-metadata.R
# This script creates metadata.csv for PACMOSData ExperimentHub resources.

eh_dir <- "eh-data"
metadata_dir <- "inst/extdata"

dir.create(metadata_dir, showWarnings = FALSE, recursive = TRUE)

files <- list.files(eh_dir, full.names = FALSE)

if (length(files) == 0) {
  stop("No files found in eh-data. Run inst/scripts/make-data.R first.")
}

titles <- tools::file_path_sans_ext(files)

source_type <- ifelse(
  grepl("\\.RData$", files),
  "RData",
  ifelse(grepl("\\.csv$", files), "CSV", "TXT")
)

dispatch_class <- ifelse(
  grepl("\\.RData$", files),
  "Rda",
  "FilePath"
)

rdata_class <- ifelse(
  grepl("\\.RData$", files),
  "list",
  NA_character_
)

description <- paste("PACMOSData resource:", titles)

metadata <- data.frame(
  Title = titles,
  Description = description,
  BiocVersion = "3.22",
  Genome = NA_character_,
  SourceType = source_type,
  SourceUrl = "https://github.com/lipikakalson/PACMOSData",
  SourceVersion = "1.0",
  Species = "Homo sapiens",
  TaxonomyId = "9606",
  Coordinate_1_based = NA_character_,
  DataProvider = "Lipika Kalson",
  Maintainer = "Lipika Kalson <lipikasingh487@gmail.com>",
  RDataClass = rdata_class,
  DispatchClass = dispatch_class,
  RDataPath = file.path("PACMOSData", files),
  Tags = "PACMOS,MOFA,multi-omics,cancer",
  stringsAsFactors = FALSE
)

write.csv(
  metadata,
  file = file.path(metadata_dir, "metadata.csv"),
  row.names = FALSE
)

message("metadata.csv written to inst/extdata/metadata.csv")
print(metadata)
