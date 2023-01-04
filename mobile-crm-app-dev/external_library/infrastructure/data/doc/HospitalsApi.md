# data_infrastructure.api.HospitalsApi

## Load the API package
```dart
import 'package:data_infrastructure/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiHospitalsGet**](HospitalsApi.md#apihospitalsget) | **GET** /api/Hospitals | 
[**apiHospitalsIDGet**](HospitalsApi.md#apihospitalsidget) | **GET** /api/Hospitals/{ID} | 


# **apiHospitalsGet**
> BuiltList<HospitalSummaryDtos> apiHospitalsGet()



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getHospitalsApi();

try { 
    final response = api.apiHospitalsGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling HospitalsApi->apiHospitalsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;HospitalSummaryDtos&gt;**](HospitalSummaryDtos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiHospitalsIDGet**
> HospitalSummaryDtos apiHospitalsIDGet(ID)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getHospitalsApi();
final String ID = ID_example; // String | 

try { 
    final response = api.apiHospitalsIDGet(ID);
    print(response);
} catch on DioError (e) {
    print('Exception when calling HospitalsApi->apiHospitalsIDGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ID** | **String**|  | 

### Return type

[**HospitalSummaryDtos**](HospitalSummaryDtos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

