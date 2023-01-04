import 'package:json_annotation/json_annotation.dart';

import '../common/crm_master_data/gender.dart';
import '../common/district.dart';
import '../common/province.dart';
import '../common/ward.dart';

part 'lead_format_address.g.dart';

@JsonSerializable()
class LeadFormatAddress {
  String? address;
  int? wardId;
  String? wardName;
  int? districtId;
  String? districtName;
  int? provinceId;
  String? provinceName;

  LeadFormatAddress({
    this.address,
    this.wardId,
    this.wardName,
    this.districtId,
    this.districtName,
    this.provinceId,
    this.provinceName,
  });

  factory LeadFormatAddress.fromJson(Map<String, dynamic> json) {
    return _$LeadFormatAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LeadFormatAddressToJson(this);

  Province? getProvince() {
    if (provinceId != null) {
      return Province(id: provinceId, provinceName: provinceName);
    }
    return null;
  }

  District? getDistrict() {
    if (districtId != null) {
      return District(id: districtId, districtName: districtName);
    }
    return null;
  }

  Ward? getWard() {
    if (wardId != null) {
      return Ward(id: districtId, wardName: wardName);
    }
    return null;
  }

  Gender? getGender() {}
}
