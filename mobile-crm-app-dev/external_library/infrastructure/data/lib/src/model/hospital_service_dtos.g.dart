// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_service_dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HospitalServiceDtos extends HospitalServiceDtos {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? forceColor;
  @override
  final String? backgroundColor;

  factory _$HospitalServiceDtos(
          [void Function(HospitalServiceDtosBuilder)? updates]) =>
      (new HospitalServiceDtosBuilder()..update(updates)).build();

  _$HospitalServiceDtos._(
      {this.id, this.name, this.forceColor, this.backgroundColor})
      : super._();

  @override
  HospitalServiceDtos rebuild(
          void Function(HospitalServiceDtosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HospitalServiceDtosBuilder toBuilder() =>
      new HospitalServiceDtosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HospitalServiceDtos &&
        id == other.id &&
        name == other.name &&
        forceColor == other.forceColor &&
        backgroundColor == other.backgroundColor;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), name.hashCode), forceColor.hashCode),
        backgroundColor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HospitalServiceDtos')
          ..add('id', id)
          ..add('name', name)
          ..add('forceColor', forceColor)
          ..add('backgroundColor', backgroundColor))
        .toString();
  }
}

class HospitalServiceDtosBuilder
    implements Builder<HospitalServiceDtos, HospitalServiceDtosBuilder> {
  _$HospitalServiceDtos? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _forceColor;
  String? get forceColor => _$this._forceColor;
  set forceColor(String? forceColor) => _$this._forceColor = forceColor;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(String? backgroundColor) =>
      _$this._backgroundColor = backgroundColor;

  HospitalServiceDtosBuilder() {
    HospitalServiceDtos._defaults(this);
  }

  HospitalServiceDtosBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _forceColor = $v.forceColor;
      _backgroundColor = $v.backgroundColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HospitalServiceDtos other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HospitalServiceDtos;
  }

  @override
  void update(void Function(HospitalServiceDtosBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HospitalServiceDtos build() {
    final _$result = _$v ??
        new _$HospitalServiceDtos._(
            id: id,
            name: name,
            forceColor: forceColor,
            backgroundColor: backgroundColor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
