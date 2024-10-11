import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

/// An instance of the [GetIt] service locator.
///
/// This instance serves as the main entry point for managing
/// and retrieving dependencies throughout the application.
/// It allows for easy access to registered services and
/// facilitates dependency injection.
final getIt = GetIt.instance;

/// Initializes and configures dependencies for the application.
///
/// This asynchronous function sets up all the dependencies
/// using the [Injectable] package. It should be called at
/// the start of the application, typically in the main method,
/// to ensure that all required services are registered
/// and ready for use.
///
/// This function does not return any value and runs
/// asynchronously to allow for any initialization processes
/// that may be required.
@InjectableInit()
Future<void> configureDependencies() async => getIt.init();