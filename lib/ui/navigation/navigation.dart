import 'package:auto_route/auto_route.dart';
import 'package:web_socket_template/ui/navigation/navigation.gr.dart';

/// An instance of [AppRouter] to manage application routing.
///
/// This is a global instance that provides access to the routing
/// configuration for the application. It is responsible for
/// defining the navigation stack and handling route transitions.
final appRouter = AppRouter();

/// A router configuration class that defines the navigation structure
/// of the application.
///
/// This class extends [RootStackRouter] and specifies the available
/// routes in the application using the [AutoRoute] package. It
/// enables easy management of navigation and route transitions.
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  /// A list of routes that the application can navigate to.
  ///
  /// This getter returns a list of [AutoRoute] objects that define
  /// the pages available in the application. The [HomeRoute] is marked
  /// as the initial route, while the [TemperatureRoute] is defined
  /// as an additional navigable route.
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: TemperatureRoute.page),
  ];
}