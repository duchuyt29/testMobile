// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadDetail _$LeadDetailFromJson(Map<String, dynamic> json) => LeadDetail(
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      status: json['status'] as int?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      id: json['id'] as int?,
      employeeId: json['employeeId'] as int?,
      genderId: json['genderId'] as int?,
      salutationId: json['salutationId'] as int?,
      leadCode: json['leadCode'] as String?,
      leadName: json['leadName'] as String?,
      leadEmail: json['leadEmail'] as String?,
      leadPhone: json['leadPhone'] as String?,
      leadStageId: json['leadStageId'] as int?,
      leadStageReasonId: json['leadStageReasonId'] as int?,
      company: json['company'] as String?,
      leadIndustryId: json['leadIndustryId'] as int?,
      leadTitle: json['leadTitle'] as String?,
      leadAddressTypeId: json['leadAddressTypeId'] as int?,
      leadSourceId: json['leadSourceId'] as int?,
      sourceDescription: json['sourceDescription'] as String?,
      leadStreet: json['leadStreet'] as String?,
      leadWardId: json['leadWardId'] as int?,
      leadWardName: json['leadWardName'] as String?,
      leadDistrictId: json['leadDistrictId'] as int?,
      leadDistrictName: json['leadDistrictName'] as String?,
      leadProvinceId: json['leadProvinceId'] as int?,
      leadProvinceName: json['leadProvinceName'] as String?,
      leadCountryId: json['leadCountryId'] as String?,
      leadCountryName: json['leadCountryName'] as String?,
      leadPostalCode: json['leadPostalCode'] as String?,
      description: json['description'] as String?,
      fullAddress: json['fullAddress'] as String?,
      leadPotentialLevelId: json['leadPotentialLevelId'] as int?,
      leadUuid: json['leadUUID'] as String?,
      isConvert: json['isConvert'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      leadProducts: (json['leadProducts'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      employeeFirstName: json['employeeFirstName'] as String?,
      employeeLastName: json['employeeLastName'] as String?,
      employeeMiddleName: json['employeeMiddleName'] as String?,
      fullNameUserCreate: json['fullNameUserCreate'] as String?,
      fullNameUserUpdate: json['fullNameUserUpdate'] as String?,
    );

Map<String, dynamic> _$LeadDetailToJson(LeadDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createDate', _dateToString(instance.createDate));
  writeNotNull('modifiedDate', _dateToString(instance.modifiedDate));
  writeNotNull('status', instance.status);
  writeNotNull('createBy', instance.createBy);
  writeNotNull('updateBy', instance.updateBy);
  writeNotNull('id', instance.id);
  writeNotNull('employeeId', instance.employeeId);
  writeNotNull('genderId', instance.genderId);
  writeNotNull('salutationId', instance.salutationId);
  writeNotNull('leadCode', instance.leadCode);
  writeNotNull('leadName', instance.leadName);
  writeNotNull('leadEmail', instance.leadEmail);
  writeNotNull('leadPhone', instance.leadPhone);
  writeNotNull('leadStageId', instance.leadStageId);
  writeNotNull('leadStageReasonId', instance.leadStageReasonId);
  writeNotNull('company', instance.company);
  writeNotNull('leadIndustryId', instance.leadIndustryId);
  writeNotNull('leadTitle', instance.leadTitle);
  writeNotNull('leadAddressTypeId', instance.leadAddressTypeId);
  writeNotNull('leadSourceId', instance.leadSourceId);
  writeNotNull('sourceDescription', instance.sourceDescription);
  writeNotNull('leadStreet', instance.leadStreet);
  writeNotNull('leadWardId', instance.leadWardId);
  writeNotNull('leadWardName', instance.leadWardName);
  writeNotNull('leadDistrictId', instance.leadDistrictId);
  writeNotNull('leadDistrictName', instance.leadDistrictName);
  writeNotNull('leadProvinceId', instance.leadProvinceId);
  writeNotNull('leadProvinceName', instance.leadProvinceName);
  writeNotNull('leadCountryId', instance.leadCountryId);
  writeNotNull('leadCountryName', instance.leadCountryName);
  writeNotNull('leadPostalCode', instance.leadPostalCode);
  writeNotNull('description', instance.description);
  writeNotNull('fullAddress', instance.fullAddress);
  writeNotNull('leadPotentialLevelId', instance.leadPotentialLevelId);
  writeNotNull('leadUUID', instance.leadUuid);
  writeNotNull('isConvert', instance.isConvert);
  writeNotNull('startDate', _dateToString(instance.startDate));
  writeNotNull('leadProducts', instance.leadProducts);
  writeNotNull('employeeFirstName', instance.employeeFirstName);
  writeNotNull('employeeLastName', instance.employeeLastName);
  writeNotNull('employeeMiddleName', instance.employeeMiddleName);
  writeNotNull('fullNameUserCreate', instance.fullNameUserCreate);
  writeNotNull('fullNameUserUpdate', instance.fullNameUserUpdate);
  return val;
}
