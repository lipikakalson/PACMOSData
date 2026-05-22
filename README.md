# PACMOSData

`PACMOSData` is an ExperimentHub data package providing reference datasets required for running the `PACMOS` framework on MESOMICS and lungNENomics cohorts.

The package contains metadata and access utilities for:

* MESOMICS reference datasets
* lungNENomics reference datasets
* PACMOS example/test datasets

---

## Installation

```r
if (!requireNamespace("remotes", quietly = TRUE)) {
    install.packages("remotes")
}

remotes::install_github("lipikakalson/PACMOSData")
```

---

## Usage

```r
library(PACMOSData)

mesomics_data <- load_pacmos_data("MESOMICS")

lungnen_data <- load_pacmos_data("lungNENomics")

test_data <- load_pacmos_data("test")
```

---

## Available datasets

### MESOMICS

* archetypes                 : Archetype proportions.
* D_alt_MOFA                 : Genomic Alterations.
* D_cnv_MOFA                 : Copy Number Alterations.
* D_exprB_MOFA               : Gene expression data.
* D_loh_MOFA                 : Loss Of Heterogeneity.
* D_met.bodB_MOFA            : Methylation gene body regions.
* D_met.enhB_MOFA            : Methylation enhancer regions.
* D_met.proB_MOFA            : Methylation promoter regions.
* MESOMICS_latent_factors    : MOFA latent factors.

### lungNENomics

* Inputs_MOFA                 : MOFA input matrices.
* lungNEN_LF_K4_with_label    : Archetype proportions with discrete molecular group classifications. 
* lungNEN_LF_K4_without_label : Archetype proportions without discrete molecular group classifications. 
* lungNEN_LFs                 : MOFA latent factors.
* lungNEN_sample_label        : Sample IDs with molecular groups.

### Test datasets

* lungNEN_test_expr           : Test expression data for lungNENomics cohort.
* MESOMICS_test_expr          : Test expression data for MESOMICS cohort.

## Related package

Main software package:

* [PACMOS](https://github.com/IARCbioinfo/PACMOS)
---
