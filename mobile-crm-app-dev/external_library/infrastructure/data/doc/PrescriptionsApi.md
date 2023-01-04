# data_infrastructure.api.PrescriptionsApi

## Load the API package
```dart
import 'package:data_infrastructure/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiPrescriptionsGet**](PrescriptionsApi.md#apiprescriptionsget) | **GET** /api/Prescriptions | 
[**apiPrescriptionsIDGet**](PrescriptionsApi.md#apiprescriptionsidget) | **GET** /api/Prescriptions/{ID} | 
[**apiPrescriptionsPost**](PrescriptionsApi.md#apiprescriptionspost) | **POST** /api/Prescriptions | 


# **apiPrescriptionsGet**
> BuiltList<PrescriptionSummaryDtos> apiPrescriptionsGet()



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getPrescriptionsApi();

try { 
    final response = api.apiPrescriptionsGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling PrescriptionsApi->apiPrescriptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PrescriptionSummaryDtos&gt;**](PrescriptionSummaryDtos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPrescriptionsIDGet**
> PrescriptionDetailDtos apiPrescriptionsIDGet(ID)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getPrescriptionsApi();
final String ID = ID_example; // String | 

try { 
    final response = api.apiPrescriptionsIDGet(ID);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PrescriptionsApi->apiPrescriptionsIDGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ID** | **String**|  | 

### Return type

[**PrescriptionDetailDtos**](PrescriptionDetailDtos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiPrescriptionsPost**
> PrescriptionDetailDtos apiPrescriptionsPost(createPrescriptionCommand)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getPrescriptionsApi();
final CreatePrescriptionCommand createPrescriptionCommand = ; // CreatePrescriptionCommand | 

try { 
    final response = api.apiPrescriptionsPost(createPrescriptionCommand);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PrescriptionsApi->apiPrescriptionsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createPrescriptionCommand** | [**CreatePrescriptionCommand**](CreatePrescriptionCommand.md)|  | [optional] 

### Return type

[**PrescriptionDetailDtos**](PrescriptionDetailDtos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

