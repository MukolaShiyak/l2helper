import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:l2helper/data/repositories/analytics_service_repository_impl.dart';
import 'package:l2helper/repositories/analytics_service_repository.dart';
import 'package:l2helper/usecase/analitycs.dart';

import 'package:l2helper/usecase/get_weapons.dart';
import 'package:l2helper/usecase/sound_effect.dart';
import 'package:l2helper/data/datasource/weapons_api.dart';
import 'package:l2helper/presentation/cubit/craft_cubit.dart';
import 'package:l2helper/repositories/weapons_repository.dart';
import 'package:l2helper/repositories/sound_effect_repository.dart';
import 'package:l2helper/data/repositories/weapons_repositories_impl.dart';
import 'package:l2helper/data/repositories/sound_effect_repository_impl.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => CraftCubit(
      locator(),
      locator(),
      locator(),
    ),
  );

  // usecase
  locator.registerLazySingleton(() => GetWeapons(locator()));
  locator.registerLazySingleton(() => SoundEffect(locator()));
  locator.registerLazySingleton(() => Analytics(locator()));

  // repository
  locator.registerLazySingleton<WeaponsRepository>(
    () => WeaponsRepositoryImpl(
      weaponsApi: locator(),
    ),
  );
  locator.registerLazySingleton<SoundEffectRepository>(
    () => SoundEffectRepositoryImpl(),
  );
  locator.registerLazySingleton<AnalyticsServiceRepository>(
    () => AnalyticsServiceRepositoryImpl(),
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
