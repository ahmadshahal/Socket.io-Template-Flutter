// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureDto _$TemperatureDtoFromJson(Map<String, dynamic> json) =>
    TemperatureDto(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$TemperatureDtoToJson(TemperatureDto instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };
