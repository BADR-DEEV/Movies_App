import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '/core/models/serializers.dart';

part 'rental_duration.g.dart';

/// An example runningtime model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class RentalDuration
    implements Built<RentalDuration, RentalDurationBuilder> {
  int? get days;

  RentalDuration._();

  String toJson() {
    return json
        .encode(serializers.serializeWith(RentalDuration.serializer, this));
  }

  factory RentalDuration.fromJson(String jsonString) {
    return serializers.deserializeWith(
      RentalDuration.serializer,
      json.decode(jsonString),
    )!;
  }

  factory RentalDuration.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      RentalDuration.serializer,
      map,
    )!;
  }

  static Serializer<RentalDuration> get serializer =>
      _$rentalDurationSerializer;

  factory RentalDuration([void Function(RentalDurationBuilder)? updates]) =
      _$RentalDuration;
}
