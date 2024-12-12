# DefaultApi

All URIs are relative to *https://toppgene.cchmc.org/API*

Method | HTTP request | Description
------------- | ------------- | -------------
[**EnrichPost**](DefaultApi.md#EnrichPost) | **POST** /enrich | Perform Functional Enrichment
[**LookupPost**](DefaultApi.md#LookupPost) | **POST** /lookup | Convert genes to Human Entrez IDs


# **EnrichPost**
> EnrichmentResponse EnrichPost(enrichment_request, pretty = var.pretty, as = var.as)

Perform Functional Enrichment

### Example
```R
library(openapi)

# Perform Functional Enrichment
#
# prepare function argument(s)
var_enrichment_request <- EnrichmentRequest$new(c(123), c(EnrichmentRequest_Categories_inner$new("GeneOntologyMolecularFunction", 123, 123, 123, 123, "None"))) # EnrichmentRequest | JSON Payload of Entrez genes and which categories needed.
var_pretty <- "pretty_example" # character | Optional. If `true` ToppGene will indent output (Optional)
var_as <- "as_example" # character | Override defaults and/or HTTP request headers for return format. The XML result is not described in this definition file, but it is substantially similar to the JSON format. (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$EnrichPost(var_enrichment_request, pretty = var_pretty, as = var_asdata_file = "result.txt")
result <- api_instance$EnrichPost(var_enrichment_request, pretty = var_pretty, as = var_as)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **enrichment_request** | [**EnrichmentRequest**](EnrichmentRequest.md)| JSON Payload of Entrez genes and which categories needed. | 
 **pretty** | **character**| Optional. If &#x60;true&#x60; ToppGene will indent output | [optional] 
 **as** | Enum [json, xml] | Override defaults and/or HTTP request headers for return format. The XML result is not described in this definition file, but it is substantially similar to the JSON format. | [optional] 

### Return type

[**EnrichmentResponse**](EnrichmentResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | A list of features grouped by Category ordered by ascending p-Value. |  -  |
| **500** | Any Error |  -  |

# **LookupPost**
> LookupResponse LookupPost(lookup_request, pretty = var.pretty, as = var.as)

Convert genes to Human Entrez IDs

### Example
```R
library(openapi)

# Convert genes to Human Entrez IDs
#
# prepare function argument(s)
var_lookup_request <- LookupRequest$new(c("Symbols_example")) # LookupRequest | 
var_pretty <- "pretty_example" # character | Optional. If `true` ToppGene will indent output (Optional)
var_as <- "as_example" # character | Override defaults and/or HTTP request headers for return format. The XML result is not described in this definition file, but it is substantially similar to the JSON format. (Optional)

api_instance <- DefaultApi$new()
# to save the result into a file, simply add the optional `data_file` parameter, e.g.
# result <- api_instance$LookupPost(var_lookup_request, pretty = var_pretty, as = var_asdata_file = "result.txt")
result <- api_instance$LookupPost(var_lookup_request, pretty = var_pretty, as = var_as)
dput(result)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **lookup_request** | [**LookupRequest**](LookupRequest.md)|  | 
 **pretty** | **character**| Optional. If &#x60;true&#x60; ToppGene will indent output | [optional] 
 **as** | Enum [json, xml] | Override defaults and/or HTTP request headers for return format. The XML result is not described in this definition file, but it is substantially similar to the JSON format. | [optional] 

### Return type

[**LookupResponse**](LookupResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | A list of features grouped by Category ordered by ascending p-Value. |  -  |
| **500** | Any Error |  -  |

