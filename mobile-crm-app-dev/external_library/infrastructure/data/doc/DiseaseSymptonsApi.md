# data_infrastructure.api.DiseaseSymptonsApi

## Load the API package
```dart
import 'package:data_infrastructure/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiDiseaseSymptonsGet**](DiseaseSymptonsApi.md#apidiseasesymptonsget) | **GET** /api/DiseaseSymptons | 
[**apiDiseaseSymptonsPost**](DiseaseSymptonsApi.md#apidiseasesymptonspost) | **POST** /api/DiseaseSymptons | 


# **apiDiseaseSymptonsGet**
> BuiltList<DiseaseSymptomSummaryDtos> apiDiseaseSymptonsGet()



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getDiseaseSymptonsApi();

try { 
    final response = api.apiDiseaseSymptonsGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DiseaseSymptonsApi->apiDiseaseSymptonsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;DiseaseSymptomSummaryDtos&gt;**](DiseaseSymptomSummaryDtos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDiseaseSymptonsPost**
> apiDiseaseSymptonsPost(createDiseaseSymptomCommand)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getDiseaseSymptonsApi();
final CreateDiseaseSymptomCommand createDiseaseSymptomCommand = ; // CreateDiseaseSymptomCommand | 

try { 
    api.apiDiseaseSymptonsPost(createDiseaseSymptomCommand);
} catch on DioError (e) {
    print('Exception when calling DiseaseSymptonsApi->apiDiseaseSymptonsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createDiseaseSymptomCommand** | [**CreateDiseaseSymptomCommand**](CreateDiseaseSymptomCommand.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

