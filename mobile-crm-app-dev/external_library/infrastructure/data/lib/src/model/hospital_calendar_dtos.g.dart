// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_calendar_dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HospitalCalendarDtos extends HospitalCalendarDtos {
  @override
  final String? day;
  @override
  final bool? isOpen;
  @override
  final String? shift;
  @override
  final String? openTime;
  @override
  final String? closeTime;

  factory _$HospitalCalendarDtos(
          [void Function(HospitalCalendarDtosBuilder)? updates]) =>
      (new HospitalCalendarDtosBuilder()..update(updates)).build();

  _$HospitalCalendarDtos._(
      {this.day, this.isOpen, this.shift, this.openTime, this.closeTime})
      : super._();

  @override
  HospitalCalendarDtos rebuild(
          void Function(HospitalCalendarDtosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HospitalCalendarDtosBuilder toBuilder() =>
      new HospitalCalendarDtosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HospitalCalendarDtos &&
        day == other.day &&
        isOpen == other.isOpen &&
        shift == other.shift &&
        openTime == other.openTime &&
        closeTime == other.closeTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, day.hashCode), isOpen.hashCode), shift.hashCode),
            openTime.hashCode),
        closeTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HospitalCalendarDtos')
          ..add('day', day)
          ..add('isOpen', isOpen)
          ..add('shift', shift)
          ..add('openTime', openTime)
          ..add('closeTime', closeTime))
        .toString();
  }
}

class HospitalCalendarDtosBuilder
    implements Builder<HospitalCalendarDtos, HospitalCalendarDtosBuilder> {
  _$HospitalCalendarDtos? _$v;

  String? _day;
  String? get day => _$this._day;
  set day(String? day) => _$this._day = day;

  bool? _isOpen;
  bool? get isOpen => _$this._isOpen;
  set isOpen(bool? isOpen) => _$this._isOpen = isOpen;

  String? _shift;
  String? get shift => _$this._shift;
  set shift(String? shift) => _$this._shift = shift;

  String? _openTime;
  String? get openTime => _$this._openTime;
  set openTime(String? openTime) => _$this._openTime = openTime;

  String? _closeTime;
  String? get closeTime => _$this._closeTime;
  set closeTime(String? closeTime) => _$this._closeTime = closeTime;

  HospitalCalendarDtosBuilder() {
    HospitalCalendarDtos._defaults(this);
  }

  HospitalCalendarDtosBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _day = $v.day;
      _isOpen = $v.isOpen;
      _shift = $v.shift;
      _openTime = $v.openTime;
      _closeTime = $v.closeTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HospitalCalendarDtos other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HospitalCalendarDtos;
  }

  @override
  void update(void Function(HospitalCalendarDtosBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HospitalCalendarDtos build() {
    final _$result = _$v ??
        new _$HospitalCalendarDtos._(
            day: day,
            isOpen: isOpen,
            shift: shift,
            openTime: openTime,
            closeTime: closeTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
