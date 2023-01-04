// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_specialist_dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DoctorsSpecialistDtos extends DoctorsSpecialistDtos {
  @override
  final String? id;
  @override
  final String? name;

  factory _$DoctorsSpecialistDtos(
          [void Function(DoctorsSpecialistDtosBuilder)? updates]) =>
      (new DoctorsSpecialistDtosBuilder()..update(updates)).build();

  _$DoctorsSpecialistDtos._({this.id, this.name}) : super._();

  @override
  DoctorsSpecialistDtos rebuild(
          void Function(DoctorsSpecialistDtosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorsSpecialistDtosBuilder toBuilder() =>
      new DoctorsSpecialistDtosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorsSpecialistDtos &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoctorsSpecialistDtos')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class DoctorsSpecialistDtosBuilder
    implements Builder<DoctorsSpecialistDtos, DoctorsSpecialistDtosBuilder> {
  _$DoctorsSpecialistDtos? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DoctorsSpecialistDtosBuilder() {
    DoctorsSpecialistDtos._defaults(this);
  }

  DoctorsSpecialistDtosBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorsSpecialistDtos other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorsSpecialistDtos;
  }

  @override
  void update(void Function(DoctorsSpecialistDtosBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoctorsSpecialistDtos build() {
    final _$result = _$v ?? new _$DoctorsSpecialistDtos._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
