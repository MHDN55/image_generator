import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_injectable_package.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();


  @lazySingleton
  Dio get dio => Dio(); 

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();


}

@InjectableInit(
  initializerName: r'$init',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async => $init(getIt);
