import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_template/data/socket_service.dart';
import 'package:web_socket_template/domain/enums/socket_event.dart';
import 'package:web_socket_template/ui/temperature_screen/temperature_state.dart';

import '../../domain/entity/received_socket_event.dart';
import '../../domain/enums/socket_connection.dart';

/// A Cubit that manages the state of temperature connections and events.
///
/// This class uses the [SocketService] to handle socket connections
/// and to listen for temperature events. It emits different states
/// based on the connection status and received temperature data.
/// It adheres to the Bloc pattern, allowing for reactive state management
/// within the application.
@injectable
class TemperatureCubit extends Cubit<TemperatureState> {
  final SocketService _socketService;

  late final StreamSubscription<SocketConnection> _connectionStreamSubscription;
  late final StreamSubscription<ReceivedSocketEvent> _temperatureEventsStreamSubscription;

  /// Creates an instance of [TemperatureCubit].
  ///
  /// [socketService] - The [SocketService] instance used for managing
  /// socket connections and events.
  TemperatureCubit({
    required SocketService socketService,
  })  : _socketService = socketService,
        super(TemperatureDisconnectedState()) {
    _subscribe();
    _subscribeToConnectionStream();
    _subscribeToTemperatureEvents();
  }

  /// Subscribes to the temperature event by emitting a subscription
  /// request to the [SocketService].
  void _subscribe() => _socketService.emit(SocketEvent.subscribe.key, null);

  /// Unsubscribes from the temperature event by emitting an unsubscribe
  /// request to the [SocketService].
  void _unsubscribe() => _socketService.emit(SocketEvent.unsubscribe.key, null);

  /// Subscribes to the socket connection state stream.
  /// Emits corresponding [TemperatureState] based on the current
  /// socket connection status.
  void _subscribeToConnectionStream() {
    _connectionStreamSubscription = _socketService.connectionStateStream.listen(
          (socketConnection) {
        if (socketConnection == SocketConnection.connecting) {
          emit(TemperatureConnectingState());
        } else if (socketConnection == SocketConnection.disconnected) {
          emit(TemperatureDisconnectedState());
        } else if (socketConnection == SocketConnection.connected) {
          emit(TemperatureConnectedState());
        }
      },
    );
  }

  /// Subscribes to the temperature events stream. Emits a
  /// [TemperatureConnectedState] with the latest temperature data
  /// whenever a [ReceiveTemperatureEvent] is received.
  void _subscribeToTemperatureEvents() {
    _temperatureEventsStreamSubscription = _socketService.eventsStream
        .where((event) => event is ReceiveTemperatureEvent)
        .listen(
          (event) {
        final castedEvent = event as ReceiveTemperatureEvent;
        emit(TemperatureConnectedState(temperature: castedEvent.data));
      },
    );
  }

  /// Closes the Cubit and cleans up resources.
  ///
  /// This method cancels the subscriptions to the socket connection
  /// and temperature events, and emits an unsubscribe request to the
  /// [SocketService] before closing.
  @override
  Future<void> close() async {
    _unsubscribe();
    _temperatureEventsStreamSubscription.cancel();
    _connectionStreamSubscription.cancel();
    super.close();
  }
}