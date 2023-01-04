//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:data_infrastructure/src/serializers.dart';
import 'package:data_infrastructure/src/auth/api_key_auth.dart';
import 'package:data_infrastructure/src/auth/basic_auth.dart';
import 'package:data_infrastructure/src/auth/bearer_auth.dart';
import 'package:data_infrastructure/src/auth/oauth.dart';
import 'package:data_infrastructure/src/api/disease_symptons_api.dart';
import 'package:data_infrastructure/src/api/doctors_api.dart';
import 'package:data_infrastructure/src/api/hospitals_api.dart';
import 'package:data_infrastructure/src/api/medical_examination_schedules_api.dart';
import 'package:data_infrastructure/src/api/prescriptions_api.dart';

class DataInfrastructure {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  DataInfrastructure({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: 5000,
              receiveTimeout: 3000,
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get DiseaseSymptonsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DiseaseSymptonsApi getDiseaseSymptonsApi() {
    return DiseaseSymptonsApi(dio, serializers);
  }

  /// Get DoctorsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DoctorsApi getDoctorsApi() {
    return DoctorsApi(dio, serializers);
  }

  /// Get HospitalsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  HospitalsApi getHospitalsApi() {
    return HospitalsApi(dio, serializers);
  }

  /// Get MedicalExaminationSchedulesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MedicalExaminationSchedulesApi getMedicalExaminationSchedulesApi() {
    return MedicalExaminationSchedulesApi(dio, serializers);
  }

  /// Get PrescriptionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PrescriptionsApi getPrescriptionsApi() {
    return PrescriptionsApi(dio, serializers);
  }
}
