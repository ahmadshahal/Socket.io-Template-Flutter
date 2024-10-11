import 'package:json_annotation/json_annotation.dart';

part 'temperature_dto.g.dart';

/// A Data Transfer Object (DTO) that represents temperature data.
///
/// This class is used for serializing and deserializing temperature
/// information when communicating with external systems, such as
/// APIs. It includes the temperature value and its associated unit.
@JsonSerializable()
class TemperatureDto {
  /// The temperature value.
  ///
  /// This property represents the measured temperature, expressed as
  /// a double. The value can be in various scales, depending on
  /// the specified unit (e.g., Celsius, Fahrenheit).
  @JsonKey(name: "value")
  final double value;

  /// The unit of measurement for the temperature.
  ///
  /// This property indicates the unit of the temperature value,
  /// which can be "C" for Celsius or "F" for Fahrenheit.
  /// It helps in interpreting the temperature value correctly.
  @JsonKey(name: "unit")
  final String unit;

  /// Constructs a [TemperatureDto] instance with the provided [value] and [unit].
  ///
  /// Both parameters are required and must be non-null. This constructor
  /// initializes the properties of the DTO.
  TemperatureDto({required this.value, required this.unit});

  /// Creates a [TemperatureDto] instance from a JSON map.
  ///
  /// This factory constructor is used to deserialize a JSON object into a
  /// [TemperatureDto] instance. It utilizes the generated
  /// [_$TemperatureDtoFromJson] function to perform the conversion.
  factory TemperatureDto.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDtoFromJson(json);

  /// Converts the [TemperatureDto] instance to a JSON map.
  ///
  /// This method is used to serialize the [TemperatureDto] instance into
  /// a JSON object. It utilizes the generated
  /// [_$TemperatureDtoToJson] function to perform the conversion.
  Map<String, dynamic> toJson() => _$TemperatureDtoToJson(this);
}