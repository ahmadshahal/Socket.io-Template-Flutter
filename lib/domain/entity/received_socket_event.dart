import 'package:web_socket_template/data/models/temperature_dto.dart';

/// A sealed class representing a generic socket event that carries data.
///
/// This class serves as a base class for various socket events that
/// are received from a server. It contains a single property, `data`,
/// which holds the payload associated with the event.
///
/// The type parameter [T] allows this class to be flexible and
/// work with different types of data as needed.
sealed class ReceivedSocketEvent<T> {
  /// The data associated with the socket event.
  ///
  /// This property contains the payload received from the socket event,
  /// represented as an instance of type [T]. It can hold any type of
  /// data depending on the specific event subclass.
  final T data;

  /// Constructs a [ReceivedSocketEvent] instance with the given [data].
  ///
  /// This constructor initializes the event with the specified
  /// data payload.
  ReceivedSocketEvent(this.data);
}

/// A specific event representing the reception of temperature data.
///
/// This class extends [ReceivedSocketEvent] to represent an event
/// where temperature information has been received from the socket.
/// It specifically uses [TemperatureDto] as the data type for the event.
class ReceiveTemperatureEvent extends ReceivedSocketEvent<TemperatureDto> {
  /// Constructs a [ReceiveTemperatureEvent] with the provided [data].
  ///
  /// This constructor initializes the temperature event with
  /// the given temperature data, which is an instance of
  /// [TemperatureDto].
  ReceiveTemperatureEvent(super.data);
}