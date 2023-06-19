// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rates _$$_RatesFromJson(Map<String, dynamic> json) => _$_Rates(
      disclaimer: json['disclaimer'] as String,
      license: json['license'] as String,
      timestamp: json['timestamp'] as int,
      base: json['base'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$_RatesToJson(_$_Rates instance) => <String, dynamic>{
      'disclaimer': instance.disclaimer,
      'license': instance.license,
      'timestamp': instance.timestamp,
      'base': instance.base,
      'rates': instance.rates,
    };
