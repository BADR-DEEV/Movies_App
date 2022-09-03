// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object?> serialize(Serializers serializers, Movie object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.release_date;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumb;
    if (value != null) {
      result
        ..add('thumb')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_disabled;
    if (value != null) {
      result
        ..add('is_disabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rental_duration;
    if (value != null) {
      result
        ..add('rental_duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(RentalDuration)));
    }
    value = object.running_time;
    if (value != null) {
      result
        ..add('running_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(RunningTime)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rental_rate;
    if (value != null) {
      result
        ..add('rental_rate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.box_office;
    if (value != null) {
      result
        ..add('box_office')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.damage_cost;
    if (value != null) {
      result
        ..add('damage_cost')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.fulltext;
    if (value != null) {
      result
        ..add('fulltext')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genre;
    if (value != null) {
      result
        ..add('genre')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Genre)));
    }
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updated_at;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'release_date':
          result.release_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thumb':
          result.thumb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_disabled':
          result.is_disabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'rental_duration':
          result.rental_duration.replace(serializers.deserialize(value,
                  specifiedType: const FullType(RentalDuration))!
              as RentalDuration);
          break;
        case 'running_time':
          result.running_time.replace(serializers.deserialize(value,
              specifiedType: const FullType(RunningTime))! as RunningTime);
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rental_rate':
          result.rental_rate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'box_office':
          result.box_office = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'damage_cost':
          result.damage_cost = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'fulltext':
          result.fulltext = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'genre':
          result.genre.replace(serializers.deserialize(value,
              specifiedType: const FullType(Genre))! as Genre);
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? release_date;
  @override
  final String? img;
  @override
  final String? thumb;
  @override
  final bool? is_disabled;
  @override
  final RentalDuration? rental_duration;
  @override
  final RunningTime? running_time;
  @override
  final String? rating;
  @override
  final int? rental_rate;
  @override
  final String? box_office;
  @override
  final int? damage_cost;
  @override
  final String? fulltext;
  @override
  final Genre? genre;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  factory _$Movie([void Function(MovieBuilder)? updates]) =>
      (new MovieBuilder()..update(updates))._build();

  _$Movie._(
      {this.id,
      this.title,
      this.description,
      this.release_date,
      this.img,
      this.thumb,
      this.is_disabled,
      this.rental_duration,
      this.running_time,
      this.rating,
      this.rental_rate,
      this.box_office,
      this.damage_cost,
      this.fulltext,
      this.genre,
      this.created_at,
      this.updated_at})
      : super._();

  @override
  Movie rebuild(void Function(MovieBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        release_date == other.release_date &&
        img == other.img &&
        thumb == other.thumb &&
        is_disabled == other.is_disabled &&
        rental_duration == other.rental_duration &&
        running_time == other.running_time &&
        rating == other.rating &&
        rental_rate == other.rental_rate &&
        box_office == other.box_office &&
        damage_cost == other.damage_cost &&
        fulltext == other.fulltext &&
        genre == other.genre &&
        created_at == other.created_at &&
        updated_at == other.updated_at;
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        id
                                                                            .hashCode),
                                                                    title
                                                                        .hashCode),
                                                                description
                                                                    .hashCode),
                                                            release_date
                                                                .hashCode),
                                                        img.hashCode),
                                                    thumb.hashCode),
                                                is_disabled.hashCode),
                                            rental_duration.hashCode),
                                        running_time.hashCode),
                                    rating.hashCode),
                                rental_rate.hashCode),
                            box_office.hashCode),
                        damage_cost.hashCode),
                    fulltext.hashCode),
                genre.hashCode),
            created_at.hashCode),
        updated_at.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Movie')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('release_date', release_date)
          ..add('img', img)
          ..add('thumb', thumb)
          ..add('is_disabled', is_disabled)
          ..add('rental_duration', rental_duration)
          ..add('running_time', running_time)
          ..add('rating', rating)
          ..add('rental_rate', rental_rate)
          ..add('box_office', box_office)
          ..add('damage_cost', damage_cost)
          ..add('fulltext', fulltext)
          ..add('genre', genre)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _release_date;
  String? get release_date => _$this._release_date;
  set release_date(String? release_date) => _$this._release_date = release_date;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  String? _thumb;
  String? get thumb => _$this._thumb;
  set thumb(String? thumb) => _$this._thumb = thumb;

  bool? _is_disabled;
  bool? get is_disabled => _$this._is_disabled;
  set is_disabled(bool? is_disabled) => _$this._is_disabled = is_disabled;

  RentalDurationBuilder? _rental_duration;
  RentalDurationBuilder get rental_duration =>
      _$this._rental_duration ??= new RentalDurationBuilder();
  set rental_duration(RentalDurationBuilder? rental_duration) =>
      _$this._rental_duration = rental_duration;

  RunningTimeBuilder? _running_time;
  RunningTimeBuilder get running_time =>
      _$this._running_time ??= new RunningTimeBuilder();
  set running_time(RunningTimeBuilder? running_time) =>
      _$this._running_time = running_time;

  String? _rating;
  String? get rating => _$this._rating;
  set rating(String? rating) => _$this._rating = rating;

  int? _rental_rate;
  int? get rental_rate => _$this._rental_rate;
  set rental_rate(int? rental_rate) => _$this._rental_rate = rental_rate;

  String? _box_office;
  String? get box_office => _$this._box_office;
  set box_office(String? box_office) => _$this._box_office = box_office;

  int? _damage_cost;
  int? get damage_cost => _$this._damage_cost;
  set damage_cost(int? damage_cost) => _$this._damage_cost = damage_cost;

  String? _fulltext;
  String? get fulltext => _$this._fulltext;
  set fulltext(String? fulltext) => _$this._fulltext = fulltext;

  GenreBuilder? _genre;
  GenreBuilder get genre => _$this._genre ??= new GenreBuilder();
  set genre(GenreBuilder? genre) => _$this._genre = genre;

  DateTime? _created_at;
  DateTime? get created_at => _$this._created_at;
  set created_at(DateTime? created_at) => _$this._created_at = created_at;

  DateTime? _updated_at;
  DateTime? get updated_at => _$this._updated_at;
  set updated_at(DateTime? updated_at) => _$this._updated_at = updated_at;

  MovieBuilder();

  MovieBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _release_date = $v.release_date;
      _img = $v.img;
      _thumb = $v.thumb;
      _is_disabled = $v.is_disabled;
      _rental_duration = $v.rental_duration?.toBuilder();
      _running_time = $v.running_time?.toBuilder();
      _rating = $v.rating;
      _rental_rate = $v.rental_rate;
      _box_office = $v.box_office;
      _damage_cost = $v.damage_cost;
      _fulltext = $v.fulltext;
      _genre = $v.genre?.toBuilder();
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Movie build() => _build();

  _$Movie _build() {
    _$Movie _$result;
    try {
      _$result = _$v ??
          new _$Movie._(
              id: id,
              title: title,
              description: description,
              release_date: release_date,
              img: img,
              thumb: thumb,
              is_disabled: is_disabled,
              rental_duration: _rental_duration?.build(),
              running_time: _running_time?.build(),
              rating: rating,
              rental_rate: rental_rate,
              box_office: box_office,
              damage_cost: damage_cost,
              fulltext: fulltext,
              genre: _genre?.build(),
              created_at: created_at,
              updated_at: updated_at);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'rental_duration';
        _rental_duration?.build();
        _$failedField = 'running_time';
        _running_time?.build();

        _$failedField = 'genre';
        _genre?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Movie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
