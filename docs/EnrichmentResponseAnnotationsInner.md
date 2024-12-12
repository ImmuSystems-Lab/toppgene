# openapi::EnrichmentResponseAnnotationsInner


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Category** | **character** |  | [optional] [Enum: [GeneOntologyMolecularFunction, GeneOntologyBiologicalProcess, GeneOntologyCellularComponent, HumanPheno, MousePheno, Domain, Pathway, Pubmed, Interaction, Cytoband, TFBS, GeneFamily, Coexpression, CoexpressionAtlas, ToppCell, Computational, Drug, Disease]] 
**ID** | **character** |  | [optional] 
**Name** | **character** |  | [optional] 
**PValue** | **numeric** |  | [optional] 
**QValueFDRBH** | **numeric** |  | [optional] 
**QValueFDRBY** | **numeric** |  | [optional] 
**QValueBonferroni** | **numeric** |  | [optional] 
**TotalGenes** | **integer** |  | [optional] 
**GenesInTerm** | **integer** |  | [optional] 
**GenesInQuery** | **integer** |  | [optional] 
**GenesInTermInQuery** | **integer** |  | [optional] 
**Source** | **character** |  | [optional] 
**URL** | **character** |  | [optional] 
**Genes** | [**array[EnrichmentResponseAnnotationsInnerGenesInner]**](EnrichmentResponse_Annotations_inner_Genes_inner.md) |  | [optional] 


