# openapi::EnrichmentRequestCategoriesInner

A category specification. All properties should be specified. ToppGene will *not* provide defaults for missing values

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Type** | **character** |  | [optional] [Enum: [GeneOntologyMolecularFunction, GeneOntologyBiologicalProcess, GeneOntologyCellularComponent, HumanPheno, MousePheno, Domain, Pathway, Pubmed, Interaction, Cytoband, TFBS, GeneFamily, Coexpression, CoexpressionAtlas, ToppCell, Computational, Drug, Disease]]
**PValue** | **numeric** |  | [optional] [default to 0.05] [Max: 1] [Min: 0]
**MinGenes** | **integer** |  | [optional] [default to 2] [Max: 5000] [Min: 1]
**MaxGenes** | **integer** |  | [optional] [default to 1500] [Max: 5000] [Min: 1]
**MaxResults** | **integer** |  | [optional] [default to 50] [Max: 5000] [Min: 1]
**Correction** | **character** |  | [optional] [default to &quot;FDR&quot;] [Enum: [None, FDR, Bonferroni]]
