// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_calendar_dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DoctorCalendarDtos extends DoctorCalendarDtos {
  @override
  final String? day;
  @override
  final bool? isAvailable;
  @override
  final String? shift;
  @override
  final String? startTime;
  @override
  final String? endTime;

  factory _$DoctorCalendarDtos(
          [void Function(DoctorCalendarDtosBuilder)? updates]) =>
      (new DoctorCalendarDtosBuilder()..update(updates)).build();

  _$DoctorCalendarDtos._(
      {this.day, this.isAvailable, this.shift, this.startTime, this.endTime})
      : super._();

  @override
  DoctorCalendarDtos rebuild(
          void Function(DoctorCalendarDtosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorCalendarDtosBuilder toBuilder() =>
      new DoctorCalendarDtosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorCalendarDtos &&
        day == other.day &&
        isAvailable == other.isAvailable &&
        shift == other.shift &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, day.hashCode), isAvailable.hashCode),
                shift.hashCode),
            startTime.hashCode),
        endTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoctorCalendarDtos')
          ..add('day', day)
          ..add('isAvailable', isAvailable)
          ..add('shift', shift)
          ..add('startTime', startTime)
          ..add('endTime', endTime))
        .toString();
  }
}

class DoctorCalendarDtosBuilder
    implements Builder<DoctorCalendarDtos, DoctorCalendarDtosBuilder> {
  _$DoctorCalendarDtos? _$v;

  String? _day;
  String? get day => _$this._day;
  set day(String? day) => _$this._day = day;

  bool? _isAvailable;
  bool? get isAvailable => _$this._isAvailable;
  set isAvailable(bool? isAvailable) => _$this._isAvailable = isAvailable;

  String? _shift;
  String? get shift => _$this._shift;
  set shift(String? shift) => _$this._shift = shift;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  DoctorCalendarDtosBuilder() {
    DoctorCalendarDtos._defaults(this);
  }

  DoctorCalendarDtosBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _day = $v.day;
      _isAvailable = $v.isAvailable;
      _shift = $v.shift;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorCalendarDtos other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorCalendarDtos;
  }

  @override
  void update(void Function(DoctorCalendarDtosBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoctorCalendarDtos build() {
    final _$result = _$v ??
        new _$DoctorCalendarDtos._(
            day: day,
            isAvailable: isAvailable,
            shift: shift,
            startTime: startTime,
            endTime: endTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
