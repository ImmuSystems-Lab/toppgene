# openapi::EnrichmentRequest


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Genes** | **array[integer]** | A list of Human Entrez ID that need functional enrichment. | [optional] 
**Categories** | [**array[EnrichmentRequestCategoriesInner]**](EnrichmentRequest_Categories_inner.md) | The Categories list is optional. If omitted, ToppGene will run on all categories with default values. Otherwise, ToppGene will only return the requested categories. | [optional] 


