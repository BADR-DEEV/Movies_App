// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_duration.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RentalDuration> _$rentalDurationSerializer =
    new _$RentalDurationSerializer();

class _$RentalDurationSerializer
    implements StructuredSerializer<RentalDuration> {
  @override
  final Iterable<Type> types = const [RentalDuration, _$RentalDuration];
  @override
  final String wireName = 'RentalDuration';

  @override
  Iterable<Object?> serialize(Serializers serializers, RentalDuration object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.days;
    if (value != null) {
      result
        ..add('days')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  RentalDuration deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RentalDurationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'days':
          result.days = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$RentalDuration extends RentalDuration {
  @override
  final int? days;

  factory _$RentalDuration([void Function(RentalDurationBuilder)? updates]) =>
      (new RentalDurationBuilder()..update(updates))._build();

  _$RentalDuration._({this.days}) : super._();

  @override
  RentalDuration rebuild(void Function(RentalDurationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RentalDurationBuilder toBuilder() =>
      new RentalDurationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RentalDuration && days == other.days;
  }

  @override
  int get hashCode {
    return $jf($jc(0, days.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RentalDuration')..add('days', days))
        .toString();
  }
}

class RentalDurationBuilder
    implements Builder<RentalDuration, RentalDurationBuilder> {
  _$RentalDuration? _$v;

  int? _days;
  int? get days => _$this._days;
  set days(int? days) => _$this._days = days;

  RentalDurationBuilder();

  RentalDurationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _days = $v.days;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RentalDuration other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RentalDuration;
  }

  @override
  void update(void Function(RentalDurationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RentalDuration build() => _build();

  _$RentalDuration _build() {
    final _$result = _$v ?? new _$RentalDuration._(days: days);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
