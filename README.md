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
<ol>
    <li>archetypes                 : Archetype proportions.</li> 
    <li>D_alt_MOFA                 : Genomic Alterations.</li>
    <li>D_cnv_MOFA                 : Copy Number Alterations.</li>
    <li>D_exprB_MOFA               : Gene expression data.</li>
    <li>D_loh_MOFA                 : Loss Of Heterogeneity.</li>
    <li>D_met.bodB_MOFA            : Methylation gene body regions.</li>
    <li>D_met.enhB_MOFA            : Methylation enhancer regions.</li>
    <li>D_met.proB_MOFA            : Methylation promoter regions.</li>
    <li>MESOMICS_latent_factors    : MOFA latent factors.</li>
</ol>


### lungNENomics
<ol>
    <li>Inputs_MOFA                 : MOFA input matrices.</li>
    <li>lungNEN_LF_K4_with_label    : Archetype proportions with discrete molecular group classifications. </li>
    <li>lungNEN_LF_K4_without_label : Archetype proportions without discrete molecular group classifications. </li>
    <li>lungNEN_LFs                 : MOFA latent factors.</li>
    <li>lungNEN_sample_label        : Sample IDs with molecular groups.</li>
</ol>

### Test datasets
<ol>
    <li>lungNEN_test_expr           : Test expression data for lungNENomics cohort.</li>
    <li>MESOMICS_test_expr          : Test expression data for MESOMICS cohort.</li>
</ol>

## Related package

Main software package:

* [PACMOS](https://github.com/IARCbioinfo/PACMOS)
---
