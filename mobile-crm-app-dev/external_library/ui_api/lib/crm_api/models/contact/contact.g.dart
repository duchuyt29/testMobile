// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
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
      contactName: json['contactName'] as String?,
      contactNameInList: json['ContactName'] as String?,
      contactNumber: json['contactNumber'] as String?,
      contactSalutationId: json['contactSalutationId'] as int?,
      contactSalutationName: json['contactSalutationName'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
      genderId: json['genderId'] as int?,
      genderName: json['genderName'] as String?,
      accountId: json['accountId'] as int?,
      accountRelationTypeId: json['accountRelationTypeId'] as int?,
      contactTitle: json['contactTitle'] as String?,
      contactDescription: json['contactDescription'] as String?,
      contactBillingStreet: json['contactBillingStreet'] as String?,
      contactBillingWardId: json['contactBillingWardId'] as int?,
      contactBillingWardName: json['contactBillingWardName'] as String?,
      contactBillingDistrictId: json['contactBillingDistrictId'] as int?,
      contactBillingDistrictName: json['contactBillingDistrictName'] as String?,
      contactBillingProvinceId: json['contactBillingProvinceId'] as int?,
      contactBillingProvinceName: json['contactBillingProvinceName'] as String?,
      contactBillingCountryId: json['contactBillingCountryId'] as String?,
      contactBillingCountryName: json['contactBillingCountryName'] as String?,
      contactBillingPostalCode: json['contactBillingPostalCode'] as String?,
      contactShippingStreet: json['contactShippingStreet'] as String?,
      contactShippingWardId: json['contactShippingWardId'] as int?,
      contactShippingWardName: json['contactShippingWardName'] as String?,
      contactShippingDistrictId: json['contactShippingDistrictId'] as int?,
      contactShippingDistrictName:
          json['contactShippingDistrictName'] as String?,
      contactShippingProvinceId: json['contactShippingProvinceId'] as int?,
      contactShippingProvinceName:
          json['contactShippingProvinceName'] as String?,
      contactShippingCountryId: json['contactShippingCountryId'] as String?,
      contactShippingCountryName: json['contactShippingCountryName'] as String?,
      contactShippingPostalCode: json['contactShippingPostalCode'] as String?,
      ownerEmployeeId: json['ownerEmployeeId'] as int?,
      contactUuid: json['contactUUID'] as String?,
      isActive: json['isActive'] as int?,
      employeeFirstName: json['employeeFirstName'] as String?,
      employeeMiddleName: json['employeeMiddleName'] as String?,
      employeeLastName: json['employeeLastName'] as String?,
      fullNameUserCreate: json['fullNameUserCreate'] as String?,
      fullNameUserUpdate: json['fullNameUserUpdate'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'createDate': _dateToString(instance.createDate),
      'modifiedDate': _dateToString(instance.modifiedDate),
      'status': instance.status,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'id': instance.id,
      'contactName': instance.contactName,
      'ContactName': instance.contactNameInList,
      'contactNumber': instance.contactNumber,
      'contactSalutationId': instance.contactSalutationId,
      'contactSalutationName': instance.contactSalutationName,
      'contactPhone': instance.contactPhone,
      'contactEmail': instance.contactEmail,
      'genderId': instance.genderId,
      'genderName': instance.genderName,
      'accountId': instance.accountId,
      'accountRelationTypeId': instance.accountRelationTypeId,
      'contactTitle': instance.contactTitle,
      'contactDescription': instance.contactDescription,
      'contactBillingStreet': instance.contactBillingStreet,
      'contactBillingWardId': instance.contactBillingWardId,
      'contactBillingWardName': instance.contactBillingWardName,
      'contactBillingDistrictId': instance.contactBillingDistrictId,
      'contactBillingDistrictName': instance.contactBillingDistrictName,
      'contactBillingProvinceId': instance.contactBillingProvinceId,
      'contactBillingProvinceName': instance.contactBillingProvinceName,
      'contactBillingCountryId': instance.contactBillingCountryId,
      'contactBillingCountryName': instance.contactBillingCountryName,
      'contactBillingPostalCode': instance.contactBillingPostalCode,
      'contactShippingStreet': instance.contactShippingStreet,
      'contactShippingWardId': instance.contactShippingWardId,
      'contactShippingWardName': instance.contactShippingWardName,
      'contactShippingDistrictId': instance.contactShippingDistrictId,
      'contactShippingDistrictName': instance.contactShippingDistrictName,
      'contactShippingProvinceId': instance.contactShippingProvinceId,
      'contactShippingProvinceName': instance.contactShippingProvinceName,
      'contactShippingCountryId': instance.contactShippingCountryId,
      'contactShippingCountryName': instance.contactShippingCountryName,
      'contactShippingPostalCode': instance.contactShippingPostalCode,
      'ownerEmployeeId': instance.ownerEmployeeId,
      'contactUUID': instance.contactUuid,
      'isActive': instance.isActive,
      'employeeFirstName': instance.employeeFirstName,
      'employeeMiddleName': instance.employeeMiddleName,
      'employeeLastName': instance.employeeLastName,
      'fullNameUserCreate': instance.fullNameUserCreate,
      'fullNameUserUpdate': instance.fullNameUserUpdate,
    };

Contacts _$ContactsFromJson(Map<String, dynamic> json) => Contacts(
      (json['content'] as List<dynamic>?)
              ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    )
      ..pageSize = json['pageSize'] as int?
      ..page = json['page'] as int?
      ..total = json['total'] as int?;

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'pageSize': instance.pageSize,
      'page': instance.page,
      'total': instance.total,
      'content': instance.content,
    };
