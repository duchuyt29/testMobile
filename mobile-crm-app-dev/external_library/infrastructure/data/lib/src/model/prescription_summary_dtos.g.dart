// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_summary_dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PrescriptionSummaryDtos extends PrescriptionSummaryDtos {
  @override
  final String? id;
  @override
  final String? customerID;
  @override
  final DateTime? createdDate;
  @override
  final String? hospitalID;
  @override
  final String? hospitalName;
  @override
  final String? hospitalAddress;
  @override
  final String? doctorID;
  @override
  final String? doctorName;
  @override
  final double? amount;
  @override
  final int? medicalExaminationScheduleID;

  factory _$PrescriptionSummaryDtos(
          [void Function(PrescriptionSummaryDtosBuilder)? updates]) =>
      (new PrescriptionSummaryDtosBuilder()..update(updates)).build();

  _$PrescriptionSummaryDtos._(
      {this.id,
      this.customerID,
      this.createdDate,
      this.hospitalID,
      this.hospitalName,
      this.hospitalAddress,
      this.doctorID,
      this.doctorName,
      this.amount,
      this.medicalExaminationScheduleID})
      : super._();

  @override
  PrescriptionSummaryDtos rebuild(
          void Function(PrescriptionSummaryDtosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrescriptionSummaryDtosBuilder toBuilder() =>
      new PrescriptionSummaryDtosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrescriptionSummaryDtos &&
        id == other.id &&
        customerID == other.customerID &&
        createdDate == other.createdDate &&
        hospitalID == other.hospitalID &&
        hospitalName == other.hospitalName &&
        hospitalAddress == other.hospitalAddress &&
        doctorID == other.doctorID &&
        doctorName == other.doctorName &&
        amount == other.amount &&
        medicalExaminationScheduleID == other.medicalExaminationScheduleID;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, id.hashCode),
                                        customerID.hashCode),
                                    createdDate.hashCode),
                                hospitalID.hashCode),
                            hospitalName.hashCode),
                        hospitalAddress.hashCode),
                    doctorID.hashCode),
                doctorName.hashCode),
            amount.hashCode),
        medicalExaminationScheduleID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PrescriptionSummaryDtos')
          ..add('id', id)
          ..add('customerID', customerID)
          ..add('createdDate', createdDate)
          ..add('hospitalID', hospitalID)
          ..add('hospitalName', hospitalName)
          ..add('hospitalAddress', hospitalAddress)
          ..add('doctorID', doctorID)
          ..add('doctorName', doctorName)
          ..add('amount', amount)
          ..add('medicalExaminationScheduleID', medicalExaminationScheduleID))
        .toString();
  }
}

class PrescriptionSummaryDtosBuilder
    implements
        Builder<PrescriptionSummaryDtos, PrescriptionSummaryDtosBuilder> {
  _$PrescriptionSummaryDtos? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _customerID;
  String? get customerID => _$this._customerID;
  set customerID(String? customerID) => _$this._customerID = customerID;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  String? _hospitalID;
  String? get hospitalID => _$this._hospitalID;
  set hospitalID(String? hospitalID) => _$this._hospitalID = hospitalID;

  String? _hospitalName;
  String? get hospitalName => _$this._hospitalName;
  set hospitalName(String? hospitalName) => _$this._hospitalName = hospitalName;

  String? _hospitalAddress;
  String? get hospitalAddress => _$this._hospitalAddress;
  set hospitalAddress(String? hospitalAddress) =>
      _$this._hospitalAddress = hospitalAddress;

  String? _doctorID;
  String? get doctorID => _$this._doctorID;
  set doctorID(String? doctorID) => _$this._doctorID = doctorID;

  String? _doctorName;
  String? get doctorName => _$this._doctorName;
  set doctorName(String? doctorName) => _$this._doctorName = doctorName;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  int? _medicalExaminationScheduleID;
  int? get medicalExaminationScheduleID => _$this._medicalExaminationScheduleID;
  set medicalExaminationScheduleID(int? medicalExaminationScheduleID) =>
      _$this._medicalExaminationScheduleID = medicalExaminationScheduleID;

  PrescriptionSummaryDtosBuilder() {
    PrescriptionSummaryDtos._defaults(this);
  }

  PrescriptionSummaryDtosBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _customerID = $v.customerID;
      _createdDate = $v.createdDate;
      _hospitalID = $v.hospitalID;
      _hospitalName = $v.hospitalName;
      _hospitalAddress = $v.hospitalAddress;
      _doctorID = $v.doctorID;
      _doctorName = $v.doctorName;
      _amount = $v.amount;
      _medicalExaminationScheduleID = $v.medicalExaminationScheduleID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrescriptionSummaryDtos other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrescriptionSummaryDtos;
  }

  @override
  void update(void Function(PrescriptionSummaryDtosBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PrescriptionSummaryDtos build() {
    final _$result = _$v ??
        new _$PrescriptionSummaryDtos._(
            id: id,
            customerID: customerID,
            createdDate: createdDate,
            hospitalID: hospitalID,
            hospitalName: hospitalName,
            hospitalAddress: hospitalAddress,
            doctorID: doctorID,
            doctorName: doctorName,
            amount: amount,
            medicalExaminationScheduleID: medicalExaminationScheduleID);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
