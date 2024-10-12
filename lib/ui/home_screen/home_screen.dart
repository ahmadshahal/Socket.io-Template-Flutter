import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_template/ui/navigation/navigation.gr.dart';

import '../../di/di.dart';
import 'home_cubit.dart';

/// A screen that serves as the home interface for the application.
///
/// This class is a [StatefulWidget] that integrates with the
/// [AutoRoute] package for navigation. It provides the initial
/// setup for the home screen and wraps its content with a
/// [BlocProvider] to manage the [HomeCubit] state.
@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  /// Creates a new instance of [HomeScreen].
  const HomeScreen({super.key});

  /// Wraps the route with a [BlocProvider] for the [HomeCubit].
  ///
  /// This method is called during route initialization and
  /// provides the necessary context for the cubit, allowing
  /// child widgets to access the cubit instance.
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeCubit>(
      lazy: false,
      create: (BuildContext context) => getIt.get<HomeCubit>(),
      child: this,
    );
  }

  /// Creates the state for the [HomeScreen].
  ///
  /// This method overrides the default implementation to provide
  /// an instance of [_HomeScreenState] which manages the
  /// lifecycle and build process of the [HomeScreen].
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

/// The state for the [HomeScreen] widget.
///
/// This class extends [State<HomeScreen>] and contains the logic
/// for building the [HomeScreen]. It manages the screen's
/// lifecycle and any interactions that require updates to the state.
class _HomeScreenState extends State<HomeScreen> {
  /// Builds the widget tree for the [HomeScreen].
  ///
  /// This method is called whenever the state changes and
  /// constructs the UI components for the home screen. It
  /// organizes the layout of widgets and handles user interactions.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to the fourth Mobile-Dev-Meetup",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                context.router.navigate(const TemperatureRoute());
              },
              color: Colors.deepPurple,
              child: const Text("View Temperature"),
            )
          ],
        ),
      ),
    );
  }
}
