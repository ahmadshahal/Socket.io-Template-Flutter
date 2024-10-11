import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:web_socket_template/data/models/temperature_dto.dart';

import '../domain/entity/received_socket_event.dart';
import '../domain/enums/socket_connection.dart';
import '../domain/enums/socket_event.dart';

/// A service class for managing a Socket.IO connection.
///
/// This class handles establishing a connection to a Socket.IO server,
/// emitting events, and listening for incoming events. It also provides
/// streams to observe connection states and received events.
@singleton
class SocketService {
  /// The socket connection instance.
  Socket? _socket;

  /// A stream controller for broadcasting received socket events.
  final _eventsStreamController = StreamController<ReceivedSocketEvent>();

  /// A broadcast stream that emits received socket events.
  late final eventsStream = _eventsStreamController.stream.asBroadcastStream();

  /// A BehaviorSubject that holds the current connection state.
  final _connectionStateBehaviorSubject =
  BehaviorSubject.seeded(SocketConnection.disconnected);

  /// A broadcast stream for observing changes in the connection state.
  late final connectionStateStream =
  _connectionStateBehaviorSubject.asBroadcastStream();

  /// Initiates a connection to the Socket.IO server.
  ///
  /// This method disconnects any existing socket connection,
  /// sets up a new connection with specified options, and initializes
  /// event listeners. The connection state is updated to 'connecting'
  /// during this process.
  void connect() {
    _socket?.disconnect();
    _socket = io(
      "https://Mobile-Dev-Meetup/2024-10",
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({'Authorization': 'Bearer TOKEN_GOES_HERE'})
          .build(),
    );

    debugPrint("CONNECTING");
    _connectionStateBehaviorSubject.add(SocketConnection.connecting);
    _initListeners();
    _socket?.connect();
  }

  /// Disconnects the current socket connection.
  ///
  /// This method terminates the connection to the Socket.IO server
  /// if a socket connection is active.
  void disconnect() => _socket?.disconnect();

  /// Emits an event with data to the Socket.IO server.
  ///
  /// This method sends an event identified by the [event] string
  /// along with [data] to the server. It logs the event name
  /// before sending.
  ///
  /// [event] - The name of the event to emit.
  /// [data] - The data to send with the event.
  void emit(String event, dynamic data) {
    debugPrint("==================");
    debugPrint("SENT: $event");
    debugPrint("==================");
    _socket?.emit(event, data);
  }

  /// Emits an event with data and an acknowledgment function.
  ///
  /// This method sends an event to the server with data and
  /// registers a callback [ack] that will be called when the server
  /// acknowledges the event.
  ///
  /// [event] - The name of the event to emit.
  /// [data] - The data to send with the event.
  /// [ack] - The acknowledgment function to be called by the server.
  void emitWithAck(String event, dynamic data, Function? ack) {
    debugPrint("==================");
    debugPrint("SENT: $event");
    debugPrint("==================");
    _socket?.emitWithAck(event, data, ack: ack);
  }

  /// Initializes event listeners for the socket connection.
  ///
  /// This private method sets up listeners for various socket events
  /// such as connection status changes and incoming temperature data.
  /// Each listener updates the connection state or processes incoming
  /// data as needed.
  void _initListeners() {
    _socket?.onConnect(
          (data) {
        debugPrint("CONNECTED");
        _connectionStateBehaviorSubject.add(SocketConnection.connected);
      },
    );
    _socket?.onConnectError(
          (data) {
        debugPrint("CONNECT_ERROR");
        _connectionStateBehaviorSubject.add(SocketConnection.disconnected);
      },
    );
    _socket?.onReconnecting(
          (data) {
        debugPrint("RECONNECTING");
        _connectionStateBehaviorSubject.add(SocketConnection.connecting);
      },
    );
    _socket?.onDisconnect(
          (data) {
        debugPrint("DISCONNECTED");
        _connectionStateBehaviorSubject.add(SocketConnection.disconnected);
      },
    );
    _socket?.on(
      SocketEvent.receiveTemperature.key,
          (data) {
        debugPrint("RECEIVE_TEMPERATURE");
        debugPrint(data.toString());
        final temperatureDto = TemperatureDto.fromJson(data);
        final receiveTemperatureEvent = ReceiveTemperatureEvent(temperatureDto);
        _eventsStreamController.add(receiveTemperatureEvent);
      },
    );
  }
}