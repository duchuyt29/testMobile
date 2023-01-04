// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_detail_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PrescriptionDetailData extends PrescriptionDetailData {
  @override
  final int? id;
  @override
  final String? drugName;
  @override
  final double? quantity;
  @override
  final String? unit;
  @override
  final double? unitPrice;
  @override
  final double? taxPercent;
  @override
  final double? totalTax;
  @override
  final double? totalNoTax;
  @override
  final double? totalWithTax;

  factory _$PrescriptionDetailData(
          [void Function(PrescriptionDetailDataBuilder)? updates]) =>
      (new PrescriptionDetailDataBuilder()..update(updates)).build();

  _$PrescriptionDetailData._(
      {this.id,
      this.drugName,
      this.quantity,
      this.unit,
      this.unitPrice,
      this.taxPercent,
      this.totalTax,
      this.totalNoTax,
      this.totalWithTax})
      : super._();

  @override
  PrescriptionDetailData rebuild(
          void Function(PrescriptionDetailDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrescriptionDetailDataBuilder toBuilder() =>
      new PrescriptionDetailDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrescriptionDetailData &&
        id == other.id &&
        drugName == other.drugName &&
        quantity == other.quantity &&
        unit == other.unit &&
        unitPrice == other.unitPrice &&
        taxPercent == other.taxPercent &&
        totalTax == other.totalTax &&
        totalNoTax == other.totalNoTax &&
        totalWithTax == other.totalWithTax;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), drugName.hashCode),
                                quantity.hashCode),
                            unit.hashCode),
                        unitPrice.hashCode),
                    taxPercent.hashCode),
                totalTax.hashCode),
            totalNoTax.hashCode),
        totalWithTax.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PrescriptionDetailData')
          ..add('id', id)
          ..add('drugName', drugName)
          ..add('quantity', quantity)
          ..add('unit', unit)
          ..add('unitPrice', unitPrice)
          ..add('taxPercent', taxPercent)
          ..add('totalTax', totalTax)
          ..add('totalNoTax', totalNoTax)
          ..add('totalWithTax', totalWithTax))
        .toString();
  }
}

class PrescriptionDetailDataBuilder
    implements Builder<PrescriptionDetailData, PrescriptionDetailDataBuilder> {
  _$PrescriptionDetailData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _drugName;
  String? get drugName => _$this._drugName;
  set drugName(String? drugName) => _$this._drugName = drugName;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  double? _taxPercent;
  double? get taxPercent => _$this._taxPercent;
  set taxPercent(double? taxPercent) => _$this._taxPercent = taxPercent;

  double? _totalTax;
  double? get totalTax => _$this._totalTax;
  set totalTax(double? totalTax) => _$this._totalTax = totalTax;

  double? _totalNoTax;
  double? get totalNoTax => _$this._totalNoTax;
  set totalNoTax(double? totalNoTax) => _$this._totalNoTax = totalNoTax;

  double? _totalWithTax;
  double? get totalWithTax => _$this._totalWithTax;
  set totalWithTax(double? totalWithTax) => _$this._totalWithTax = totalWithTax;

  PrescriptionDetailDataBuilder() {
    PrescriptionDetailData._defaults(this);
  }

  PrescriptionDetailDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _drugName = $v.drugName;
      _quantity = $v.quantity;
      _unit = $v.unit;
      _unitPrice = $v.unitPrice;
      _taxPercent = $v.taxPercent;
      _totalTax = $v.totalTax;
      _totalNoTax = $v.totalNoTax;
      _totalWithTax = $v.totalWithTax;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrescriptionDetailData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrescriptionDetailData;
  }

  @override
  void update(void Function(PrescriptionDetailDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PrescriptionDetailData build() {
    final _$result = _$v ??
        new _$PrescriptionDetailData._(
            id: id,
            drugName: drugName,
            quantity: quantity,
            unit: unit,
            unitPrice: unitPrice,
            taxPercent: taxPercent,
            totalTax: totalTax,
            totalNoTax: totalNoTax,
            totalWithTax: totalWithTax);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
