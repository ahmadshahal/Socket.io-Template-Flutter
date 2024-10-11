/// An enumeration representing the possible states of a socket connection.
///
/// This enum is used to indicate the current connection status 
/// of a socket to a server. It can help manage the connection 
/// state within the application, allowing for appropriate 
/// responses based on the current status.
enum SocketConnection {
  /// Indicates that the socket is currently connected to the server.
  ///
  /// When in this state, data can be sent and received over the socket.
  connected,

  /// Indicates that the socket is currently disconnected from the server.
  ///
  /// This state signifies that there is no active connection, 
  /// and data cannot be sent or received until the connection is 
  /// re-established.
  disconnected,

  /// Indicates that the socket is in the process of connecting to the server.
  ///
  /// This state represents an intermediate status where the socket 
  /// is attempting to establish a connection. It can be used to show 
  /// loading indicators or other UI elements during the connection 
  /// process.
  connecting
}