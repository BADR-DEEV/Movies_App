import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movieapp/core/models/rental_duration/rental_duration.dart';

import '../genre/genre.dart';
import '../running_time/running_time.dart';
import '/core/models/serializers.dart';

part 'movie.g.dart';

/// An example movie model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Movie implements Built<Movie, MovieBuilder> {
  String? get id; // uuid
  String? get title;
  String? get description;
  String? get release_date;
  String? get img;
  String? get thumb;
  bool? get is_disabled;
  RentalDuration? get rental_duration;
  RunningTime? get running_time;
  String? get rating;
  int? get rental_rate;
  String? get box_office;
  int? get damage_cost;
  String? get fulltext;
  Genre? get genre;
  DateTime? get created_at;
  DateTime? get updated_at;

  Movie._();

  String toJson() {
    return json.encode(serializers.serializeWith(Movie.serializer, this));
  }

  factory Movie.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Movie.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Movie.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Movie.serializer,
      map,
    )!;
  }

  static Serializer<Movie> get serializer => _$movieSerializer;

  factory Movie([void Function(MovieBuilder)? updates]) = _$Movie;
}
