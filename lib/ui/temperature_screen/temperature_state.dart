import 'package:web_socket_template/data/models/temperature_dto.dart';

/// A sealed class representing the different states of temperature
/// connection in the application.
///
/// This class serves as the base class for various states related
/// to the temperature feature, allowing for a clear representation
/// of the connection status.
sealed class TemperatureState {}

/// Represents the disconnected state of the temperature feature.
///
/// This state indicates that there is no active connection to the
/// temperature service. It can be used to trigger UI changes or
/// other logic when the application is unable to retrieve temperature
/// data.
class TemperatureDisconnectedState extends TemperatureState {}

/// Represents the connecting state of the temperature feature.
///
/// This state indicates that the application is in the process of
/// establishing a connection to the temperature service. It can be
/// used to show loading indicators or other UI elements that inform
/// the user that a connection is being attempted.
class TemperatureConnectingState extends TemperatureState {}

/// Represents the connected state of the temperature feature.
///
/// This state indicates that the application has successfully connected
/// to the temperature service and is ready to receive data. It may
/// optionally contain a [TemperatureDto] instance, which holds the
/// current temperature information.
///
/// [temperature] - An optional [TemperatureDto] object containing the
/// current temperature value and unit. This allows for the immediate
/// display of temperature data upon connection.
class TemperatureConnectedState extends TemperatureState {
  final TemperatureDto? temperature;

  TemperatureConnectedState({this.temperature});
}