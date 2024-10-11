import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_template/ui/temperature_screen/temperature_cubit.dart';
import 'package:web_socket_template/ui/temperature_screen/temperature_state.dart';

import '../../di/di.dart';

/// A screen that displays temperature information.
///
/// This class uses the [AutoRouteWrapper] interface to provide routing
/// capabilities and integrates with the [BlocProvider] for state management
/// using [TemperatureCubit]. The screen listens to the temperature
/// connection state and displays appropriate messages or data based on
/// the current state.
@RoutePage()
class TemperatureScreen extends StatefulWidget implements AutoRouteWrapper {
  const TemperatureScreen({super.key});

  /// Wraps the route with a [BlocProvider] for [TemperatureCubit].
  ///
  /// This method initializes the [TemperatureCubit] and provides it
  /// to the widget tree below, ensuring that the temperature state can
  /// be accessed throughout the screen.
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TemperatureCubit>(
      create: (BuildContext context) => getIt.get<TemperatureCubit>(),
      child: this,
    );
  }

  /// Creates the state for the [TemperatureScreen].
  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

/// The state for the [TemperatureScreen] widget.
///
/// This class extends [State<TemperatureScreen>] and contains the logic
/// for building the [TemperatureScreen]. It manages the screen's
/// lifecycle and any interactions that require updates to the state.
class _TemperatureScreenState extends State<TemperatureScreen> {
  /// Builds the widget tree for the [TemperatureScreen].
  ///
  /// This method is called whenever the state changes and
  /// constructs the UI components for the home screen. It
  /// organizes the layout of widgets and handles user interactions.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature Screen"),
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: BlocBuilder<TemperatureCubit, TemperatureState>(
          builder: (context, state) {
            if (state is TemperatureDisconnectedState) {
              return const Text("Socket Disconnected");
            } else if (state is TemperatureConnectedState) {
              return Column(
                children: [
                  Text(
                    "Socket is connected, expecting values soon",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  if (state.temperature != null)
                    Text(
                      "Temperature: ${state.temperature?.value}${state.temperature?.unit}",
                    )
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
