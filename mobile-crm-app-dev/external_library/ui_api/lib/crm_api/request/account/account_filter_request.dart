import 'package:json_annotation/json_annotation.dart';

import '../../models/account/account.dart';
import '../../models/activity/activity_account.dart';
import '../../models/common/district.dart';
import '../../models/common/province.dart';
import '../../models/common/ward.dart';
import '../../models/contact/contact.dart';
import '../../models/employee/employee_model.dart';

part 'account_filter_request.g.dart';

@JsonSerializable()
class AccountFilterRequest {
  List<EmployeeModel>? ownerEmployee;
  int? accountTypeId;
  int? industryId;
  List<Contact>? relativeContact;
  ActivityAccount? relativeAccount;
  int? genderId;
  @JsonKey(defaultValue: '')
  String? accountBillingCountryId;
  Province? accountBillingProvince;
  District? accountBillingDistrict;
  Ward? accountBillingWard;

  AccountFilterRequest({
    this.ownerEmployee,
    this.industryId,
    this.accountTypeId,
    this.genderId,
    this.relativeAccount,
    this.relativeContact,
    this.accountBillingCountryId,
    this.accountBillingProvince,
    this.accountBillingDistrict,
    this.accountBillingWard,
  });

  factory AccountFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountFilterRequestToJson(this);

  String ownerEmployeeIdToString() {
    var output = '';
    final ids = ownerEmployee?.map((e) => e.id);
    if (ids != null) {
      output = ids.join(',');
    }
    return output;
  }

  String ownerEmployeeNameToString() {
    var output = '';
    final names = ownerEmployee?.map((e) => e.getFullname());
    if (names != null) {
      output = names.join(', \n');
    }
    return output;
  }

  String contactIdToString() {
    var output = '';
    final ids = relativeContact?.map((e) => e.id);
    if (ids != null) {
      output = ids.join(',');
    }
    return output;
  }

  String contactNameToString() {
    var output = '';
    final names = relativeContact?.map((e) => e.contactName);
    if (names != null) {
      output = names.join(', \n');
    }
    return output;
  }
}
