import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:one_context/one_context.dart';
import 'package:take_home/core/services/api_service.dart';
import 'package:take_home/core/services/short_hand.dart';
import 'package:take_home/injection_container/injects/inject_cubits.dart';
import 'package:take_home/injection_container/injects/inject_datasources.dart';
import 'package:take_home/injection_container/injects/inject_repositories.dart';
import 'package:take_home/injection_container/injects/inject_usecases.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// service
  sl
    ..registerFactory<BuildContext>(() => OneContext.instance.context!)
    ..registerLazySingleton<ApiService>(ApiService.new)
    ..registerLazySingleton<ShortHand>(ShortHand.new);

  /// Data Sources
  InjectableDataSources.inject();

  /// Repositories
  InjectableRepositories.inject();

  /// Use cases
  InjectableUseCases.inject();

  /// Cubits
  InjectableCubits.inject();
}
