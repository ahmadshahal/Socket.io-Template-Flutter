// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:web_socket_template/data/socket_service.dart' as _i228;
import 'package:web_socket_template/ui/home_screen/home_cubit.dart' as _i116;
import 'package:web_socket_template/ui/temperature_screen/temperature_cubit.dart'
    as _i734;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i228.SocketService>(() => _i228.SocketService());
    gh.factory<_i116.HomeCubit>(
        () => _i116.HomeCubit(socketService: gh<_i228.SocketService>()));
    gh.factory<_i734.TemperatureCubit>(
        () => _i734.TemperatureCubit(socketService: gh<_i228.SocketService>()));
    return this;
  }
}
