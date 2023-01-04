// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_medical_examination_schedule_command.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateMedicalExaminationScheduleCommand
    extends CreateMedicalExaminationScheduleCommand {
  @override
  final String? customerID;
  @override
  final String? customerName;
  @override
  final String? customerGender;
  @override
  final String? hospitalID;
  @override
  final String? hospitalName;
  @override
  final String? hospitalAddress;
  @override
  final String? department;
  @override
  final DateTime? examinationDate;
  @override
  final BuiltList<String>? diseaseSymptoms;

  factory _$CreateMedicalExaminationScheduleCommand(
          [void Function(CreateMedicalExaminationScheduleCommandBuilder)?
              updates]) =>
      (new CreateMedicalExaminationScheduleCommandBuilder()..update(updates))
          .build();

  _$CreateMedicalExaminationScheduleCommand._(
      {this.customerID,
      this.customerName,
      this.customerGender,
      this.hospitalID,
      this.hospitalName,
      this.hospitalAddress,
      this.department,
      this.examinationDate,
      this.diseaseSymptoms})
      : super._();

  @override
  CreateMedicalExaminationScheduleCommand rebuild(
          void Function(CreateMedicalExaminationScheduleCommandBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateMedicalExaminationScheduleCommandBuilder toBuilder() =>
      new CreateMedicalExaminationScheduleCommandBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateMedicalExaminationScheduleCommand &&
        customerID == other.customerID &&
        customerName == other.customerName &&
        customerGender == other.customerGender &&
        hospitalID == other.hospitalID &&
        hospitalName == other.hospitalName &&
        hospitalAddress == other.hospitalAddress &&
        department == other.department &&
        examinationDate == other.examinationDate &&
        diseaseSymptoms == other.diseaseSymptoms;
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
                                $jc($jc(0, customerID.hashCode),
                                    customerName.hashCode),
                                customerGender.hashCode),
                            hospitalID.hashCode),
                        hospitalName.hashCode),
                    hospitalAddress.hashCode),
                department.hashCode),
            examinationDate.hashCode),
        diseaseSymptoms.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'CreateMedicalExaminationScheduleCommand')
          ..add('customerID', customerID)
          ..add('customerName', customerName)
          ..add('customerGender', customerGender)
          ..add('hospitalID', hospitalID)
          ..add('hospitalName', hospitalName)
          ..add('hospitalAddress', hospitalAddress)
          ..add('department', department)
          ..add('examinationDate', examinationDate)
          ..add('diseaseSymptoms', diseaseSymptoms))
        .toString();
  }
}

class CreateMedicalExaminationScheduleCommandBuilder
    implements
        Builder<CreateMedicalExaminationScheduleCommand,
            CreateMedicalExaminationScheduleCommandBuilder> {
  _$CreateMedicalExaminationScheduleCommand? _$v;

  String? _customerID;
  String? get customerID => _$this._customerID;
  set customerID(String? customerID) => _$this._customerID = customerID;

  String? _customerName;
  String? get customerName => _$this._customerName;
  set customerName(String? customerName) => _$this._customerName = customerName;

  String? _customerGender;
  String? get customerGender => _$this._customerGender;
  set customerGender(String? customerGender) =>
      _$this._customerGender = customerGender;

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

  String? _department;
  String? get department => _$this._department;
  set department(String? department) => _$this._department = department;

  DateTime? _examinationDate;
  DateTime? get examinationDate => _$this._examinationDate;
  set examinationDate(DateTime? examinationDate) =>
      _$this._examinationDate = examinationDate;

  ListBuilder<String>? _diseaseSymptoms;
  ListBuilder<String> get diseaseSymptoms =>
      _$this._diseaseSymptoms ??= new ListBuilder<String>();
  set diseaseSymptoms(ListBuilder<String>? diseaseSymptoms) =>
      _$this._diseaseSymptoms = diseaseSymptoms;

  CreateMedicalExaminationScheduleCommandBuilder() {
    CreateMedicalExaminationScheduleCommand._defaults(this);
  }

  CreateMedicalExaminationScheduleCommandBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _customerID = $v.customerID;
      _customerName = $v.customerName;
      _customerGender = $v.customerGender;
      _hospitalID = $v.hospitalID;
      _hospitalName = $v.hospitalName;
      _hospitalAddress = $v.hospitalAddress;
      _department = $v.department;
      _examinationDate = $v.examinationDate;
      _diseaseSymptoms = $v.diseaseSymptoms?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateMedicalExaminationScheduleCommand other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateMedicalExaminationScheduleCommand;
  }

  @override
  void update(
      void Function(CreateMedicalExaminationScheduleCommandBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreateMedicalExaminationScheduleCommand build() {
    _$CreateMedicalExaminationScheduleCommand _$result;
    try {
      _$result = _$v ??
          new _$CreateMedicalExaminationScheduleCommand._(
              customerID: customerID,
              customerName: customerName,
              customerGender: customerGender,
              hospitalID: hospitalID,
              hospitalName: hospitalName,
              hospitalAddress: hospitalAddress,
              department: department,
              examinationDate: examinationDate,
              diseaseSymptoms: _diseaseSymptoms?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'diseaseSymptoms';
        _diseaseSymptoms?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreateMedicalExaminationScheduleCommand',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
