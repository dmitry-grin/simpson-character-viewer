import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:simpsons_character_viewer/app/data/network/result.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/domain/entities/character_dto.dart';

/// An abstract class defining a data source for fetching characters.
abstract class CharactersDataSource {
  /// Fetches a list of character data.
  ///
  /// Returns a [Result] containing a list of [CharacterDto] on success,
  /// or an [Exception] on failure.
  Future<Result<List<CharacterDto>, Exception>> fetchCharacters();
}

class CharactersDataSourceImpl implements CharactersDataSource {
  CharactersDataSourceImpl(this.client);

  final Dio client;

  static const _path = '?q=simpsons+characters&format=json';

  @override
  Future<Result<List<CharacterDto>, Exception>> fetchCharacters() async {
    try {
      final response = await client.get(_path);

      switch (response.statusCode) {
        case 200:

          final Map<String, dynamic> data = jsonDecode(response.data);
          final List<dynamic> relatedTopics = data['RelatedTopics'];
          List<CharacterDto> characters = relatedTopics.map((json) => CharacterDto.fromJson(json)).toList();

          return Success(characters);

        default:
          return Failure(Exception(response.statusMessage));
      }
    } on DioException catch (e) {
      return Failure(e);
    }
  }
}
