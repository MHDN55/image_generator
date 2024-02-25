// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'core/network/network_info.dart' as _i6;
import 'Features/home/data/datasources/image_generator_remote_data_source.dart'
    as _i4;
import 'Features/home/data/repositories/image_generator_repositoies_impl.dart'
    as _i9;
import 'Features/home/domain/repositories/image_generator_repositoies.dart'
    as _i8;
import 'Features/home/domain/usecases/get_image_use_case.dart' as _i10;
import 'Features/home/presentation/blocs/bloc/image_generator_bloc.dart'
    as _i11;
import 'injection_injectable_package.dart' as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.ImageGeneratorRemoteDataSource>(
      () => _i4.ImageGeneratorRemoteDataSourceImpl(dio: gh<_i3.Dio>()));
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i8.ImageGeneratorRepository>(
      () => _i9.ImageGeneratorRepositoryImpl(
            networkInfo: gh<_i6.NetworkInfo>(),
            remoteDataSource: gh<_i4.ImageGeneratorRemoteDataSource>(),
          ));
  gh.lazySingleton<_i10.GetImageUserCase>(() =>
      _i10.GetImageUserCase(repository: gh<_i8.ImageGeneratorRepository>()));
  gh.factory<_i11.ImageGeneratorBloc>(
      () => _i11.ImageGeneratorBloc(getImage: gh<_i10.GetImageUserCase>()));
  return getIt;
}

class _$RegisterModule extends _i12.RegisterModule {}
