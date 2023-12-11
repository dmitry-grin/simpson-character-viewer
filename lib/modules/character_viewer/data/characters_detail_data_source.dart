import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:simpsons_character_viewer/app/data/network/result.dart';
import 'package:simpsons_character_viewer/app/data/ram_storage.dart';

abstract class CharacterDetailDataSource {
  Future<Result<Uint8List, Exception>> loadImage(String path);
}

class CharacterDetailDataSourceImpl implements CharacterDetailDataSource {
  CharacterDetailDataSourceImpl(
    Dio dio, {
    required RamStorage localDataSource,
  })  : _client = dio,
        _localDataSource = localDataSource;

  final Dio _client;
  final RamStorage _localDataSource;

  @override
  Future<Result<Uint8List, Exception>> loadImage(String path) async {
    if (_localDataSource.contains(path)) {
      return Success(_localDataSource.take(path));
    }

    try {
      final response = await _client.getUri(
        Uri.parse('https://duckduckgo.com$path'),
        options: Options(responseType: ResponseType.bytes),
      );

      switch (response.statusCode) {
        case 200:
          final data = response.data as List<int>;

          final bytesList = Uint8List.fromList(data);

          _localDataSource.put(path, bytesList);

          return Success(Uint8List.fromList(bytesList));
        default:
          return Failure(Exception(response.statusMessage));
      }
    } on DioException catch (e) {
      return Failure(e);
    }
  }
}

class CharacterDetailsLocalDataSource implements RamStorage {
  final Map<String, dynamic> _cachedImgMap = {};

  @override
  bool contains(String key) => _cachedImgMap.containsKey(key);

  @override
  void put(String key, data) {
    _cachedImgMap[key] = data;
  }

  @override
  T? take<T>(String key) => _cachedImgMap[key];
}
