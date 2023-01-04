import 'package:json_annotation/json_annotation.dart';
import 'package:sicix/shared/utils/date_util.dart';
import 'package:tiengviet/tiengviet.dart';

import '../../../sicix_api/models/base_models.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  @JsonKey(toJson: _dateToString)
  DateTime? createDate;
  @JsonKey(toJson: _dateToString)
  DateTime? modifiedDate;
  int? status;
  String? createBy;
  String? updateBy;
  int? id;
  String? contactName;
  @JsonKey(name: 'ContactName')
  String? contactNameInList;
  String? contactNumber;
  int? contactSalutationId;
  String? contactSalutationName;
  String? contactPhone;
  String? contactEmail;
  int? genderId;
  String? genderName;
  int? accountId;
  int? accountRelationTypeId;
  String? contactTitle;
  String? contactDescription;
  String? contactBillingStreet;
  int? contactBillingWardId;
  String? contactBillingWardName;
  int? contactBillingDistrictId;
  String? contactBillingDistrictName;
  int? contactBillingProvinceId;
  String? contactBillingProvinceName;
  String? contactBillingCountryId;
  String? contactBillingCountryName;
  String? contactBillingPostalCode;
  String? contactShippingStreet;
  int? contactShippingWardId;
  String? contactShippingWardName;
  int? contactShippingDistrictId;
  String? contactShippingDistrictName;
  int? contactShippingProvinceId;
  String? contactShippingProvinceName;
  String? contactShippingCountryId;
  String? contactShippingCountryName;
  String? contactShippingPostalCode;
  int? ownerEmployeeId;
  @JsonKey(name: 'contactUUID')
  String? contactUuid;
  int? isActive;
  String? employeeFirstName;
  String? employeeMiddleName;
  String? employeeLastName;
  String? fullNameUserCreate;
  String? fullNameUserUpdate;

  Contact({
    this.createDate,
    this.modifiedDate,
    this.status,
    this.createBy,
    this.updateBy,
    this.id,
    this.contactName,
    this.contactNameInList,
    this.contactNumber,
    this.contactSalutationId,
    this.contactSalutationName,
    this.contactPhone,
    this.contactEmail,
    this.genderId,
    this.genderName,
    this.accountId,
    this.accountRelationTypeId,
    this.contactTitle,
    this.contactDescription,
    this.contactBillingStreet,
    this.contactBillingWardId,
    this.contactBillingWardName,
    this.contactBillingDistrictId,
    this.contactBillingDistrictName,
    this.contactBillingProvinceId,
    this.contactBillingProvinceName,
    this.contactBillingCountryId,
    this.contactBillingCountryName,
    this.contactBillingPostalCode,
    this.contactShippingStreet,
    this.contactShippingWardId,
    this.contactShippingWardName,
    this.contactShippingDistrictId,
    this.contactShippingDistrictName,
    this.contactShippingProvinceId,
    this.contactShippingProvinceName,
    this.contactShippingCountryId,
    this.contactShippingCountryName,
    this.contactShippingPostalCode,
    this.ownerEmployeeId,
    this.contactUuid,
    this.isActive,
    this.employeeFirstName,
    this.employeeMiddleName,
    this.employeeLastName,
    this.fullNameUserCreate,
    this.fullNameUserUpdate,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return _$ContactFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  String getOwnerEmployeeName() {
    return '${employeeLastName ?? ''} ${employeeMiddleName ?? ''} ${employeeFirstName ?? ''}';
  }

  String getCreateAtContent() {
    return '${fullNameUserCreate ?? ''}, ${DateUtil.formatDatetimeToString(createDate, type: DateUtil.DATETIME_TYPE)} ';
  }

  String getUpdateAtContent() {
    return '${fullNameUserUpdate ?? ''}, ${DateUtil.formatDatetimeToString(modifiedDate, type: DateUtil.DATETIME_TYPE)} ';
  }

  bool isCompare(String searchText) {
    return TiengViet.parse(contactName ?? '')
        .toLowerCase()
        .contains(TiengViet.parse(searchText).toLowerCase());
  }

  String getShippingAddress() {
    final nameOption = <String>[];
    if (contactShippingPostalCode != null) {
      nameOption.add(contactShippingPostalCode ?? '');
    }
    if (contactShippingStreet != null) {
      nameOption.add(contactShippingStreet ?? '');
    }
    if (contactShippingWardName != null) {
      nameOption.add(contactShippingWardName ?? '');
    }
    if (contactShippingDistrictName != null) {
      nameOption.add(contactShippingDistrictName ?? '');
    }
    if (contactShippingProvinceName != null) {
      nameOption.add(contactShippingProvinceName ?? '');
    }
    if (contactShippingCountryName != null) {
      nameOption.add(contactShippingCountryName ?? '');
    }
    return nameOption.join(', ');
  }

  String getBillingAddress() {
    final nameOption = <String>[];
    if (contactBillingPostalCode != null) {
      nameOption.add(contactBillingPostalCode ?? '');
    }
    if (contactBillingStreet != null) {
      nameOption.add(contactBillingStreet ?? '');
    }
    if (contactBillingWardName != null) {
      nameOption.add(contactBillingWardName ?? '');
    }
    if (contactBillingDistrictName != null) {
      nameOption.add(contactBillingDistrictName ?? '');
    }
    if (contactBillingProvinceName != null) {
      nameOption.add(contactBillingProvinceName ?? '');
    }
    if (contactBillingCountryName != null) {
      nameOption.add(contactBillingCountryName ?? '');
    }
    return nameOption.join(', ');
  }
}

@JsonSerializable()
class Contacts extends BaseModels {
  @JsonKey(defaultValue: [])
  List<Contact> content;

  Contacts(this.content);

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}

String? _dateToString(DateTime? date) {
  // return date?.toUtc().toString() ?? '';
  if (date == null) {
    return null;
  }
  return DateUtil.formatDatetimeToString(date.toUtc(), type: DateUtil.API_TYPE);
}
