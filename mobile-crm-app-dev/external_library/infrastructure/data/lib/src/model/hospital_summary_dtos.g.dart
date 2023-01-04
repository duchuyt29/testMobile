// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_summary_dtos.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HospitalSummaryDtos extends HospitalSummaryDtos {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final String? address;
  @override
  final String? website;
  @override
  final String? phone;
  @override
  final String? lat;
  @override
  final String? long;
  @override
  final BuiltList<HospitalCalendarDtos>? calendars;
  @override
  final BuiltList<HospitalServiceDtos>? services;

  factory _$HospitalSummaryDtos(
          [void Function(HospitalSummaryDtosBuilder)? updates]) =>
      (new HospitalSummaryDtosBuilder()..update(updates)).build();

  _$HospitalSummaryDtos._(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.address,
      this.website,
      this.phone,
      this.lat,
      this.long,
      this.calendars,
      this.services})
      : super._();

  @override
  HospitalSummaryDtos rebuild(
          void Function(HospitalSummaryDtosBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HospitalSummaryDtosBuilder toBuilder() =>
      new HospitalSummaryDtosBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HospitalSummaryDtos &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        image == other.image &&
        address == other.address &&
        website == other.website &&
        phone == other.phone &&
        lat == other.lat &&
        long == other.long &&
        calendars == other.calendars &&
        services == other.services;
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
                                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                                        description.hashCode),
                                    image.hashCode),
                                address.hashCode),
                            website.hashCode),
                        phone.hashCode),
                    lat.hashCode),
                long.hashCode),
            calendars.hashCode),
        services.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HospitalSummaryDtos')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('image', image)
          ..add('address', address)
          ..add('website', website)
          ..add('phone', phone)
          ..add('lat', lat)
          ..add('long', long)
          ..add('calendars', calendars)
          ..add('services', services))
        .toString();
  }
}

class HospitalSummaryDtosBuilder
    implements Builder<HospitalSummaryDtos, HospitalSummaryDtosBuilder> {
  _$HospitalSummaryDtos? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _lat;
  String? get lat => _$this._lat;
  set lat(String? lat) => _$this._lat = lat;

  String? _long;
  String? get long => _$this._long;
  set long(String? long) => _$this._long = long;

  ListBuilder<HospitalCalendarDtos>? _calendars;
  ListBuilder<HospitalCalendarDtos> get calendars =>
      _$this._calendars ??= new ListBuilder<HospitalCalendarDtos>();
  set calendars(ListBuilder<HospitalCalendarDtos>? calendars) =>
      _$this._calendars = calendars;

  ListBuilder<HospitalServiceDtos>? _services;
  ListBuilder<HospitalServiceDtos> get services =>
      _$this._services ??= new ListBuilder<HospitalServiceDtos>();
  set services(ListBuilder<HospitalServiceDtos>? services) =>
      _$this._services = services;

  HospitalSummaryDtosBuilder() {
    HospitalSummaryDtos._defaults(this);
  }

  HospitalSummaryDtosBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _image = $v.image;
      _address = $v.address;
      _website = $v.website;
      _phone = $v.phone;
      _lat = $v.lat;
      _long = $v.long;
      _calendars = $v.calendars?.toBuilder();
      _services = $v.services?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HospitalSummaryDtos other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HospitalSummaryDtos;
  }

  @override
  void update(void Function(HospitalSummaryDtosBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HospitalSummaryDtos build() {
    _$HospitalSummaryDtos _$result;
    try {
      _$result = _$v ??
          new _$HospitalSummaryDtos._(
              id: id,
              name: name,
              description: description,
              image: image,
              address: address,
              website: website,
              phone: phone,
              lat: lat,
              long: long,
              calendars: _calendars?.build(),
              services: _services?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'calendars';
        _calendars?.build();
        _$failedField = 'services';
        _services?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HospitalSummaryDtos', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
