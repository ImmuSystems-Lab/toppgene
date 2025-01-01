The toppgene R/Bioconductor package provides a client interface to the ToppGene
API for gene list enrichment analysis <https://toppgene.cchmc.org/API>.

# Installation for development

```R
install.packages(c("BiocManager", "devtools"))
options(repos = BiocManager::repositories())
remotes::install_deps(dependencies = TRUE)
devtools::load_all()
```
