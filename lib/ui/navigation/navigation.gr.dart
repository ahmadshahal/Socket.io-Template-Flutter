// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:web_socket_template/ui/home_screen/home_screen.dart' as _i1;
import 'package:web_socket_template/ui/temperature_screen/temperature_screen.dart'
    as _i2;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i1.HomeScreen());
    },
  );
}

/// generated route for
/// [_i2.TemperatureScreen]
class TemperatureRoute extends _i3.PageRouteInfo<void> {
  const TemperatureRoute({List<_i3.PageRouteInfo>? children})
      : super(
          TemperatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'TemperatureRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i2.TemperatureScreen());
    },
  );
}
