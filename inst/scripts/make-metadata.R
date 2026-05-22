files <- list.files("eh-data")

metadata <- data.frame(
  Title = tools::file_path_sans_ext(files),
  Description = paste("PACMOS data resource:", tools::file_path_sans_ext(files)),
  BiocVersion = "3.22",
  Genome = NA_character_,
  SourceType = ifelse(grepl("\\.rda$", files), "RData", "TXT"),
  SourceUrl = "https://github.com/lipikakalson/PACMOSData",
  SourceVersion = "1.0",
  Species = "Homo sapiens",
  TaxonomyId = "9606",
  Coordinate_1_based = NA_character_,
  DataProvider = "LIPIKA KALSON",
  Maintainer = "lipikasingh487@gmail.com",
  RDataClass = ifelse(grepl("\\.rda$", files), "list", NA_character_),
  DispatchClass = ifelse(grepl("\\.rda$", files), "Rda", "FilePath"),
  RDataPath = file.path("PACMOSData", files),
  Tags = "PACMOS,MOFA,multi-omics,cancer"
)

write.csv(
  metadata,
  file = "inst/extdata/metadata.csv",
  row.names = FALSE
)
