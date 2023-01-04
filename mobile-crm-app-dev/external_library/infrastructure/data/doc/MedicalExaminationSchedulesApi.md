# data_infrastructure.api.MedicalExaminationSchedulesApi

## Load the API package
```dart
import 'package:data_infrastructure/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiMedicalExaminationSchedulesCustomerIDCustomerGet**](MedicalExaminationSchedulesApi.md#apimedicalexaminationschedulescustomeridcustomerget) | **GET** /api/MedicalExaminationSchedules/{customerID}/customer | 
[**apiMedicalExaminationSchedulesDoctorIDDoctorGet**](MedicalExaminationSchedulesApi.md#apimedicalexaminationschedulesdoctoriddoctorget) | **GET** /api/MedicalExaminationSchedules/{doctorID}/doctor | 
[**apiMedicalExaminationSchedulesGet**](MedicalExaminationSchedulesApi.md#apimedicalexaminationschedulesget) | **GET** /api/MedicalExaminationSchedules | 
[**apiMedicalExaminationSchedulesHospitalIDHospitalGet**](MedicalExaminationSchedulesApi.md#apimedicalexaminationscheduleshospitalidhospitalget) | **GET** /api/MedicalExaminationSchedules/{hospitalID}/hospital | 
[**apiMedicalExaminationSchedulesIDGet**](MedicalExaminationSchedulesApi.md#apimedicalexaminationschedulesidget) | **GET** /api/MedicalExaminationSchedules/{ID} | 
[**apiMedicalExaminationSchedulesPost**](MedicalExaminationSchedulesApi.md#apimedicalexaminationschedulespost) | **POST** /api/MedicalExaminationSchedules | 


# **apiMedicalExaminationSchedulesCustomerIDCustomerGet**
> apiMedicalExaminationSchedulesCustomerIDCustomerGet(customerID)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getMedicalExaminationSchedulesApi();
final String customerID = customerID_example; // String | 

try { 
    api.apiMedicalExaminationSchedulesCustomerIDCustomerGet(customerID);
} catch on DioError (e) {
    print('Exception when calling MedicalExaminationSchedulesApi->apiMedicalExaminationSchedulesCustomerIDCustomerGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerID** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMedicalExaminationSchedulesDoctorIDDoctorGet**
> apiMedicalExaminationSchedulesDoctorIDDoctorGet(doctorID)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getMedicalExaminationSchedulesApi();
final String doctorID = doctorID_example; // String | 

try { 
    api.apiMedicalExaminationSchedulesDoctorIDDoctorGet(doctorID);
} catch on DioError (e) {
    print('Exception when calling MedicalExaminationSchedulesApi->apiMedicalExaminationSchedulesDoctorIDDoctorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **doctorID** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMedicalExaminationSchedulesGet**
> apiMedicalExaminationSchedulesGet()



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getMedicalExaminationSchedulesApi();

try { 
    api.apiMedicalExaminationSchedulesGet();
} catch on DioError (e) {
    print('Exception when calling MedicalExaminationSchedulesApi->apiMedicalExaminationSchedulesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMedicalExaminationSchedulesHospitalIDHospitalGet**
> apiMedicalExaminationSchedulesHospitalIDHospitalGet(hospitalID)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getMedicalExaminationSchedulesApi();
final String hospitalID = hospitalID_example; // String | 

try { 
    api.apiMedicalExaminationSchedulesHospitalIDHospitalGet(hospitalID);
} catch on DioError (e) {
    print('Exception when calling MedicalExaminationSchedulesApi->apiMedicalExaminationSchedulesHospitalIDHospitalGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **hospitalID** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMedicalExaminationSchedulesIDGet**
> apiMedicalExaminationSchedulesIDGet(ID)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getMedicalExaminationSchedulesApi();
final int ID = 789; // int | 

try { 
    api.apiMedicalExaminationSchedulesIDGet(ID);
} catch on DioError (e) {
    print('Exception when calling MedicalExaminationSchedulesApi->apiMedicalExaminationSchedulesIDGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ID** | **int**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiMedicalExaminationSchedulesPost**
> apiMedicalExaminationSchedulesPost(createMedicalExaminationScheduleCommand)



### Example 
```dart
import 'package:data_infrastructure/api.dart';

final api = DataInfrastructure().getMedicalExaminationSchedulesApi();
final CreateMedicalExaminationScheduleCommand createMedicalExaminationScheduleCommand = ; // CreateMedicalExaminationScheduleCommand | 

try { 
    api.apiMedicalExaminationSchedulesPost(createMedicalExaminationScheduleCommand);
} catch on DioError (e) {
    print('Exception when calling MedicalExaminationSchedulesApi->apiMedicalExaminationSchedulesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMedicalExaminationScheduleCommand** | [**CreateMedicalExaminationScheduleCommand**](CreateMedicalExaminationScheduleCommand.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/_*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

