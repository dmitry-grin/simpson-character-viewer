import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:simpsons_character_viewer/app/network/result.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/data/characters_detail_data_source.dart';

main() {
  const key = '/abc';
  final data = Uint8List.fromList([1, 2, 3]);

  group('CharactersDetailDataSource', () {
    test('should provide cached value if there is one', () async {
      // Arrange
      final ramStorage = CharacterDetailsLocalDataSource();
      ramStorage.put(key, data);

      final dataSource = CharacterDetailDataSourceImpl(Dio(), localDataSource: ramStorage);

      // Act
      final result = await dataSource.loadImage(key);
      final resultData = result as Success;

      // Assert
      expect(resultData.value, equals(data));
    });
  });

  test('should cache data if request succeeds', () async {
    // Arrange
    final ramStorage = CharacterDetailsLocalDataSource();
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    
    dioAdapter.onGet('https://duckduckgo.com$key', (server) => server.reply(200, data));

    final dataSource = CharacterDetailDataSourceImpl(dio, localDataSource: ramStorage);

    // Act
    await dataSource.loadImage(key);

    // Assert
    expect(ramStorage.contains(key), true);
  });
}
