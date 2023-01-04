library infrastructure;

import 'package:data_infrastructure/data_infrastructure.dart';
import 'package:dio/dio.dart';
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: DioProperties(
    pubName: 'data_infrastructure',
  ),
  inputSpecFile: 'swagger.json',
  generatorName: Generator.dioNext,
  outputDirectory: 'data',
)
class Infrastructure extends DataInfrastructure {
  final Dio dioClient;

  late DoctorsApi _doctorsApi;
  late DiseaseSymptonsApi _diseaseSymptonsApi;
  late HospitalsApi _hospitalsApi;
  late MedicalExaminationSchedulesApi _schedulesApi;
  late PrescriptionsApi _prescriptionsApi;

  Infrastructure({
    required this.dioClient,
  }) : super(dio: dioClient) {
    _doctorsApi = DoctorsApi(dioClient, this.serializers);
    _diseaseSymptonsApi = DiseaseSymptonsApi(dioClient, this.serializers);
    _hospitalsApi = HospitalsApi(dioClient, this.serializers);
    _schedulesApi = MedicalExaminationSchedulesApi(dioClient, this.serializers);
    _prescriptionsApi = PrescriptionsApi(dioClient, this.serializers);
  }
  DoctorsApi get doctorsApi => _doctorsApi;
  DiseaseSymptonsApi get diseaseSymptonsApi => _diseaseSymptonsApi;
  HospitalsApi get hospitalsApi => _hospitalsApi;
  MedicalExaminationSchedulesApi get schedulesApi => _schedulesApi;
  PrescriptionsApi get prescriptionsApi => _prescriptionsApi;
}
