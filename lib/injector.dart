import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:l2helper/usecase/get_weapons.dart';
import 'package:l2helper/data/datasource/weapons_api.dart';
import 'package:l2helper/presentation/cubit/craft_cubit.dart';
import 'package:l2helper/repositories/weapons_repository.dart';
import 'package:l2helper/data/repositories/weapons_repositories_impl.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => CraftCubit(locator()));

  // usecase
  locator.registerLazySingleton(() => GetWeapons(locator()));

  // repository
  locator.registerLazySingleton<WeaponsRepository>(
    () => WeaponsRepositoryImpl(
      weaponsApi: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<WeaponsApi>(
    () => WeaponsApiImpl(
      dio: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => Dio());
  // locator.registerLazySingleton(() => const FlutterSecureStorage());
}
