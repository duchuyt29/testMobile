//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:data_infrastructure/src/date_serializer.dart';
import 'package:data_infrastructure/src/model/date.dart';

import 'package:data_infrastructure/src/model/create_disease_symptom_command.dart';
import 'package:data_infrastructure/src/model/create_medical_examination_schedule_command.dart';
import 'package:data_infrastructure/src/model/create_prescription_command.dart';
import 'package:data_infrastructure/src/model/disease_symptom_summary_dtos.dart';
import 'package:data_infrastructure/src/model/doctor_calendar_dtos.dart';
import 'package:data_infrastructure/src/model/doctor_summary_dtos.dart';
import 'package:data_infrastructure/src/model/doctors_specialist_dtos.dart';
import 'package:data_infrastructure/src/model/hospital_calendar_dtos.dart';
import 'package:data_infrastructure/src/model/hospital_service_dtos.dart';
import 'package:data_infrastructure/src/model/hospital_summary_dtos.dart';
import 'package:data_infrastructure/src/model/prescription_detail_data.dart';
import 'package:data_infrastructure/src/model/prescription_detail_dtos.dart';
import 'package:data_infrastructure/src/model/prescription_summary_dtos.dart';

part 'serializers.g.dart';

@SerializersFor([
  CreateDiseaseSymptomCommand,
  CreateMedicalExaminationScheduleCommand,
  CreatePrescriptionCommand,
  DiseaseSymptomSummaryDtos,
  DoctorCalendarDtos,
  DoctorSummaryDtos,
  DoctorsSpecialistDtos,
  HospitalCalendarDtos,
  HospitalServiceDtos,
  HospitalSummaryDtos,
  PrescriptionDetailData,
  PrescriptionDetailDtos,
  PrescriptionSummaryDtos,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(DiseaseSymptomSummaryDtos)]),
        () => ListBuilder<DiseaseSymptomSummaryDtos>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(DoctorSummaryDtos)]),
        () => ListBuilder<DoctorSummaryDtos>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(HospitalSummaryDtos)]),
        () => ListBuilder<HospitalSummaryDtos>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(PrescriptionSummaryDtos)]),
        () => ListBuilder<PrescriptionSummaryDtos>(),
      )
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
