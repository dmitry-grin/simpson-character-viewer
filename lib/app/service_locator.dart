import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:simpsons_character_viewer/app/data/network/network_config.dart';
import 'package:simpsons_character_viewer/app/domain/factory/dio_factory.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/data/characters_detail_data_source.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerSingleton<Dio>(
      DioFactory().create(
        args: {'networkConfig': DefaultNetworkConfig()},
      ),
    );
    getIt.registerSingleton<CharacterDetailsLocalDataSource>(
      CharacterDetailsLocalDataSource(),
    );
  }
}
