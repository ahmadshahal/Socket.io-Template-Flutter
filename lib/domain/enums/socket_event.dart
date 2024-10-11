/// An enumeration representing various socket events used in the application.
///
/// This enum defines specific events that can be emitted or listened 
/// to in the context of socket communication. Each event is associated 
/// with a unique string key that is used for identification in the 
/// socket protocol.
enum SocketEvent {
  /// Event indicating a request to subscribe to a specific data stream.
  ///
  /// This event is used to initiate a subscription for updates or 
  /// notifications regarding specific data from the server.
  subscribe("SUBSCRIBE"),

  /// Event indicating a request to unsubscribe from a specific data stream.
  ///
  /// This event is used to terminate a subscription, stopping any 
  /// further updates or notifications from the server for that data.
  unsubscribe("UNSUBSCRIBE"),

  /// Event indicating the receipt of temperature data from the server.
  ///
  /// This event is triggered when temperature data is sent from 
  /// the server to the client, allowing the application to handle 
  /// the received temperature information accordingly.
  receiveTemperature("RECEIVE_TEMPERATURE");

  /// Creates an instance of [SocketEvent] with the given string [key].
  ///
  /// The [key] is used to identify the socket event in the 
  /// communication protocol. Each event has a unique key 
  /// corresponding to its purpose.
  const SocketEvent(this.key);

  /// The string key associated with the socket event.
  ///
  /// This property provides the key for the event, which can be 
  /// used when emitting or listening for events in the socket 
  /// communication process.
  final String key;
}