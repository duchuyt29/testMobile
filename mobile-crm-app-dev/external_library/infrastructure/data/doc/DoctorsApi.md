# data_infrastructure.api.DoctorsApi

## Load the API package
```dart
import 'package:data_infrastructure/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiDoctorsGet**](DoctorsApi.md#apidoctorsget) | **GET** /api/Doctors | 
[**apiDoctorsIDGet**](DoctorsApi.md#apidoctorsidget) | **GET** /api/Doctors/{ID} | 


# **apiDoctorsGet**
> BuiltList<DoctorSummaryDtos> apiDoctorsGet()



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getDoctorsApi();

try { 
    final response = api.apiDoctorsGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DoctorsApi->apiDoctorsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;DoctorSummaryDtos&gt;**](DoctorSummaryDtos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiDoctorsIDGet**
> DoctorSummaryDtos apiDoctorsIDGet(ID)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getDoctorsApi();
final String ID = ID_example; // String | 

try { 
    final response = api.apiDoctorsIDGet(ID);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DoctorsApi->apiDoctorsIDGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ID** | **String**|  | 

### Return type

[**DoctorSummaryDtos**](DoctorSummaryDtos.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

