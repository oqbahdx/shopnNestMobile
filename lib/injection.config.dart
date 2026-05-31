// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/network/dio_module.dart' as _i731;
import 'core/services/toast/fluttertoast_service.dart' as _i186;
import 'core/services/toast/toast_service.dart' as _i180;
import 'features/auth/data/datasources/auth_remote_data_source.dart' as _i767;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i111;
import 'features/auth/domain/repositories/auth_repository.dart' as _i1015;
import 'features/auth/domain/usecases/register_usecase.dart' as _i693;
import 'features/auth/presentation/bloc/register/register_bloc.dart' as _i649;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i767.AuthRemoteDataSource>(
      () => _i767.AuthRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i180.ToastService>(() => _i186.FluttertoastService());
    gh.lazySingleton<_i1015.AuthRepository>(
      () => _i111.AuthRepositoryImpl(
        remoteDataSource: gh<_i767.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i693.RegisterUseCase>(
      () => _i693.RegisterUseCase(gh<_i1015.AuthRepository>()),
    );
    gh.factory<_i649.RegisterBloc>(
      () => _i649.RegisterBloc(gh<_i693.RegisterUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i731.DioModule {}
