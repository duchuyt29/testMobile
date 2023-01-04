// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_summary_dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DoctorSummaryDtos extends DoctorSummaryDtos {
  @override
  final String? id;
  @override
  final String? hospitalID;
  @override
  final String? hospitalName;
  @override
  final String? fullName;
  @override
  final String? phone;
  @override
  final String? age;
  @override
  final String? image;
  @override
  final BuiltList<DoctorsSpecialistDtos>? specialists;
  @override
  final BuiltList<DoctorCalendarDtos>? calendars;

  factory _$DoctorSummaryDtos(
          [void Function(DoctorSummaryDtosBuilder)? updates]) =>
      (new DoctorSummaryDtosBuilder()..update(updates)).build();

  _$DoctorSummaryDtos._(
      {this.id,
      this.hospitalID,
      this.hospitalName,
      this.fullName,
      this.phone,
      this.age,
      this.image,
      this.specialists,
      this.calendars})
      : super._();

  @override
  DoctorSummaryDtos rebuild(void Function(DoctorSummaryDtosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorSummaryDtosBuilder toBuilder() =>
      new DoctorSummaryDtosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorSummaryDtos &&
        id == other.id &&
        hospitalID == other.hospitalID &&
        hospitalName == other.hospitalName &&
        fullName == other.fullName &&
        phone == other.phone &&
        age == other.age &&
        image == other.image &&
        specialists == other.specialists &&
        calendars == other.calendars;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), hospitalID.hashCode),
                                hospitalName.hashCode),
                            fullName.hashCode),
                        phone.hashCode),
                    age.hashCode),
                image.hashCode),
            specialists.hashCode),
        calendars.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoctorSummaryDtos')
          ..add('id', id)
          ..add('hospitalID', hospitalID)
          ..add('hospitalName', hospitalName)
          ..add('fullName', fullName)
          ..add('phone', phone)
          ..add('age', age)
          ..add('image', image)
          ..add('specialists', specialists)
          ..add('calendars', calendars))
        .toString();
  }
}

class DoctorSummaryDtosBuilder
    implements Builder<DoctorSummaryDtos, DoctorSummaryDtosBuilder> {
  _$DoctorSummaryDtos? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _hospitalID;
  String? get hospitalID => _$this._hospitalID;
  set hospitalID(String? hospitalID) => _$this._hospitalID = hospitalID;

  String? _hospitalName;
  String? get hospitalName => _$this._hospitalName;
  set hospitalName(String? hospitalName) => _$this._hospitalName = hospitalName;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _age;
  String? get age => _$this._age;
  set age(String? age) => _$this._age = age;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<DoctorsSpecialistDtos>? _specialists;
  ListBuilder<DoctorsSpecialistDtos> get specialists =>
      _$this._specialists ??= new ListBuilder<DoctorsSpecialistDtos>();
  set specialists(ListBuilder<DoctorsSpecialistDtos>? specialists) =>
      _$this._specialists = specialists;

  ListBuilder<DoctorCalendarDtos>? _calendars;
  ListBuilder<DoctorCalendarDtos> get calendars =>
      _$this._calendars ??= new ListBuilder<DoctorCalendarDtos>();
  set calendars(ListBuilder<DoctorCalendarDtos>? calendars) =>
      _$this._calendars = calendars;

  DoctorSummaryDtosBuilder() {
    DoctorSummaryDtos._defaults(this);
  }

  DoctorSummaryDtosBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _hospitalID = $v.hospitalID;
      _hospitalName = $v.hospitalName;
      _fullName = $v.fullName;
      _phone = $v.phone;
      _age = $v.age;
      _image = $v.image;
      _specialists = $v.specialists?.toBuilder();
      _calendars = $v.calendars?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorSummaryDtos other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorSummaryDtos;
  }

  @override
  void update(void Function(DoctorSummaryDtosBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoctorSummaryDtos build() {
    _$DoctorSummaryDtos _$result;
    try {
      _$result = _$v ??
          new _$DoctorSummaryDtos._(
              id: id,
              hospitalID: hospitalID,
              hospitalName: hospitalName,
              fullName: fullName,
              phone: phone,
              age: age,
              image: image,
              specialists: _specialists?.build(),
              calendars: _calendars?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'specialists';
        _specialists?.build();
        _$failedField = 'calendars';
        _calendars?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DoctorSummaryDtos', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
