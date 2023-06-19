// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rates _$RatesFromJson(Map<String, dynamic> json) {
  return _Rates.fromJson(json);
}

/// @nodoc
mixin _$Rates {
  String get disclaimer => throw _privateConstructorUsedError;
  String get license => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  String get base => throw _privateConstructorUsedError;
  Map<String, double> get rates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatesCopyWith<Rates> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesCopyWith<$Res> {
  factory $RatesCopyWith(Rates value, $Res Function(Rates) then) =
      _$RatesCopyWithImpl<$Res, Rates>;
  @useResult
  $Res call(
      {String disclaimer,
      String license,
      int timestamp,
      String base,
      Map<String, double> rates});
}

/// @nodoc
class _$RatesCopyWithImpl<$Res, $Val extends Rates>
    implements $RatesCopyWith<$Res> {
  _$RatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disclaimer = null,
    Object? license = null,
    Object? timestamp = null,
    Object? base = null,
    Object? rates = null,
  }) {
    return _then(_value.copyWith(
      disclaimer: null == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String,
      license: null == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatesCopyWith<$Res> implements $RatesCopyWith<$Res> {
  factory _$$_RatesCopyWith(_$_Rates value, $Res Function(_$_Rates) then) =
      __$$_RatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String disclaimer,
      String license,
      int timestamp,
      String base,
      Map<String, double> rates});
}

/// @nodoc
class __$$_RatesCopyWithImpl<$Res> extends _$RatesCopyWithImpl<$Res, _$_Rates>
    implements _$$_RatesCopyWith<$Res> {
  __$$_RatesCopyWithImpl(_$_Rates _value, $Res Function(_$_Rates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disclaimer = null,
    Object? license = null,
    Object? timestamp = null,
    Object? base = null,
    Object? rates = null,
  }) {
    return _then(_$_Rates(
      disclaimer: null == disclaimer
          ? _value.disclaimer
          : disclaimer // ignore: cast_nullable_to_non_nullable
              as String,
      license: null == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rates extends _Rates {
  _$_Rates(
      {required this.disclaimer,
      required this.license,
      required this.timestamp,
      required this.base,
      required final Map<String, double> rates})
      : _rates = rates,
        super._();

  factory _$_Rates.fromJson(Map<String, dynamic> json) =>
      _$$_RatesFromJson(json);

  @override
  final String disclaimer;
  @override
  final String license;
  @override
  final int timestamp;
  @override
  final String base;
  final Map<String, double> _rates;
  @override
  Map<String, double> get rates {
    if (_rates is EqualUnmodifiableMapView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rates);
  }

  @override
  String toString() {
    return 'Rates(disclaimer: $disclaimer, license: $license, timestamp: $timestamp, base: $base, rates: $rates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rates &&
            (identical(other.disclaimer, disclaimer) ||
                other.disclaimer == disclaimer) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.base, base) || other.base == base) &&
            const DeepCollectionEquality().equals(other._rates, _rates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, disclaimer, license, timestamp,
      base, const DeepCollectionEquality().hash(_rates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatesCopyWith<_$_Rates> get copyWith =>
      __$$_RatesCopyWithImpl<_$_Rates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatesToJson(
      this,
    );
  }
}

abstract class _Rates extends Rates {
  factory _Rates(
      {required final String disclaimer,
      required final String license,
      required final int timestamp,
      required final String base,
      required final Map<String, double> rates}) = _$_Rates;
  _Rates._() : super._();

  factory _Rates.fromJson(Map<String, dynamic> json) = _$_Rates.fromJson;

  @override
  String get disclaimer;
  @override
  String get license;
  @override
  int get timestamp;
  @override
  String get base;
  @override
  Map<String, double> get rates;
  @override
  @JsonKey(ignore: true)
  _$$_RatesCopyWith<_$_Rates> get copyWith =>
      throw _privateConstructorUsedError;
}
