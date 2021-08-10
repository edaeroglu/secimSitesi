
import 'package:get_it/get_it.dart';
import 'package:login_page_day_23/apis/userApi.dart';
import 'package:login_page_day_23/repositories/userRepo.dart';
import 'package:login_page_day_23/services/prefService.dart';




final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserApi());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => PrefService());
}
