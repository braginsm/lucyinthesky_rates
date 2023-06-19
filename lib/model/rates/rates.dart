import 'package:freezed_annotation/freezed_annotation.dart';

part 'rates.freezed.dart';
part 'rates.g.dart';

@freezed
class Rates with _$Rates {
  factory Rates({
    required String disclaimer,
    required String license,
    required int timestamp,
    required String base,
    required Map<String, double> rates,
  }) = _Rates;

  Rates._();

  factory Rates.fromJson(Map<String, dynamic> json) => _$RatesFromJson(json);
}
