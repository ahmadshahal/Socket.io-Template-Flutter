import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_template/data/socket_service.dart';
import 'package:web_socket_template/ui/home_screen/home_state.dart';

/// A Cubit responsible for managing the state of the home screen.
///
/// This class extends [Cubit<HomeState>] and encapsulates the logic
/// related to the home screen's state management. It interacts with
/// the [SocketService] to establish and manage a socket connection,
/// which can be used to receive and send data relevant to the home
/// screen.
@injectable
class HomeCubit extends Cubit<HomeState> {
  /// The [SocketService] instance used for socket communication.
  ///
  /// This private field is used to connect to and interact with the
  /// socket server, enabling real-time data exchange within the home
  /// screen context.
  final SocketService _socketService;

  /// Constructs a [HomeCubit] with the provided [socketService].
  ///
  /// This constructor initializes the cubit with the required
  /// [SocketService] instance and sets the initial state to
  /// [HomeInitialState]. It also initiates a connection to the
  /// socket server by calling the [_connect] method.
  HomeCubit({
    required SocketService socketService,
  })  : _socketService = socketService,
        super(HomeInitialState()) {
    _connect();
  }

  /// Establishes a connection to the socket server.
  ///
  /// This private method calls the [connect] method of the
  /// [SocketService] to initiate the socket connection. It is
  /// automatically called during the cubit's initialization.
  void _connect() =>
      _socketService.connect();

  /// Disconnects from the socket server.
  ///
  /// This private method calls the [disconnect] method of the
  /// [SocketService] to terminate the socket connection.
  void _disconnect() =>
      _socketService.disconnect();

  /// Closes the cubit and disconnects from the socket service.
  ///
  /// This method overrides the [close] method from the base class
  /// and ensures that the socket connection is terminated when the
  /// cubit is closed. It calls the [_disconnect] method before
  /// invoking the superclass's close method.
  @override
  Future<void> close() async {
    _disconnect();
    super.close();
  }
}