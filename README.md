The toppsuite R Bioconductor package provides a client interface to the Topp
Suite for gene list enrichment analysis:

- <https://toppgene.cchmc.org/API> for a single set gene list.
- <https://toppcluster.cchmc.org> for multiple gene lists.

# Installation for development

```R
install.packages(c("BiocManager", "devtools"))
options(repos = BiocManager::repositories())
remotes::install_deps(dependencies = TRUE)
devtools::load_all()
```
