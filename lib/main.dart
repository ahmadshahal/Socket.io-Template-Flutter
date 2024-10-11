import 'package:flutter/material.dart';
import 'package:web_socket_template/ui/navigation/navigation.dart';

import 'di/di.dart';

/// The entry point of the Flutter application.
///
/// This function ensures that Flutter's widget binding is initialized,
/// configures dependencies using [configureDependencies], and then
/// launches the application by calling [runApp] with the [MyApp] widget.
void main() async {
  // Ensures that Flutter is initialized before executing the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Configures dependency injection for the application.
  await configureDependencies();

  // Starts the Flutter application with the MyApp widget.
  runApp(const MyApp());
}

/// The root widget of the application.
///
/// This widget serves as the entry point for the Flutter app, setting up
/// the MaterialApp with routing capabilities and a dark theme. It defines
/// the configuration for the router, allowing navigation throughout the app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Builds the MaterialApp for the application.
  ///
  /// This method returns a [MaterialApp.router] configured with the app's
  /// router, title, and theme. It sets the overall appearance and behavior
  /// of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: "Socket.io Template",
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
