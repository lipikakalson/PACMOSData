# PACMOSData

PACMOSData is an ExperimentHub data package that provides reference datasets for use with the PACMOS framework. These resources support projection-based analyses of independent query samples using reference multi-omics latent factor spaces derived from the MESOMICS and lungNENomics studies.

PACMOS is a computational framework designed to project query samples into pretrained multi-omics latent spaces and compare them with reference cohorts. It enables the interpretation of new samples in relation to previously defined molecular factors, archetypes, or molecular groups.

PACMOSData contains metadata and access utilities for:

MESOMICS: Multi-omics study of pleural mesothelioma.
lungNENomics: Multi-omics study of lung neuroendocrine neoplasms.

MOFA, or Multi-Omics Factor Analysis, is an unsupervised factor analysis framework for integrating multiple omics layers. MOFA identifies latent factors that capture major sources of variation across molecular data types. In PACMOS workflows, these latent factor spaces are used as reference spaces for comparing independent query samples.

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

query_data <- load_pacmos_data("query")
```

---

## Available datasets

### MESOMICS
<ol></ol>
    <li>MESOMICS_archetypes     : Archetype proportions.</li> 
    <li>MESOMICS_MOFA_inputs    : MOFA input matrices.</li>
    <li>MESOMICS_latent_factors : MOFA latent factors.</li>
</ol>


### lungNENomics
<ol>
    <li>lungNENomics_MOFA_inputs           : MOFA input matrices.</li>
    <li>lungNENomics_archetypes_with_label : Archetype proportions with discrete molecular group classifications.</li>
    <li>lungNEN_latent_factors             : MOFA latent factors.</li>
    <li>lungNEN_sample_label               : Sample IDs with molecular groups.</li>
</ol>

### Test datasets
<ol>
    <li>lungNEN_query_expr           : Query expression data for lungNENomics cohort.</li>
    <li>MESOMICS_query_expr          : Query expression data for MESOMICS cohort.</li>
</ol>

## Related package

Main software package:

* [PACMOS](https://github.com/IARCbioinfo/PACMOS)
---
