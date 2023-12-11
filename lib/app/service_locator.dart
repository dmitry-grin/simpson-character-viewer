import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simpsons_character_viewer/app/data/network/network_config.dart';
import 'package:simpsons_character_viewer/app/domain/factory/dio_factory.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/data/characters_detail_data_source.dart';

/// The singleton instance of GetIt, a popular Dart dependency injection container.
final getIt = GetIt.instance;

/// A service locator class responsible for initializing and configuring dependency injection using GetIt.
///
/// It provides a centralized location for managing the application's dependency injection.
class ServiceLocator {
  /// Initializes dependencies.
  static void init() {
    // Registering a singleton instance of Dio, a network library, with a specified network configuration.
    getIt.registerSingleton<Dio>(
      DioFactory().create(
        args: {'networkConfig': DefaultNetworkConfig()},
      ),
    );

    // Registering a singleton instance of CharacterDetailsLocalDataSource, a local data storage service.
    getIt.registerSingleton<CharacterDetailsLocalDataSource>(
      CharacterDetailsLocalDataSource(),
    );
  }
}

