import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:simpsons_character_viewer/app/network/result.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/domain/entities/character.dart';

abstract class CharactersDataSource {
  Future<Result<List<Character>, Exception>> fetchCharacters();
}

class CharactersDataSourceImpl implements CharactersDataSource {
  CharactersDataSourceImpl(this.client);

  final Dio client;

  static const _path = '?q=simpsons+characters&format=json';

  @override
  Future<Result<List<Character>, Exception>> fetchCharacters() async {
    try {
      final response = await client.get(_path);

      switch (response.statusCode) {
        case 200:

          final Map<String, dynamic> data = jsonDecode(response.data);
          final List<dynamic> relatedTopics = data['RelatedTopics'];
          List<Character> characters = relatedTopics.map((json) => Character.fromJson(json)).toList();

          return Success(characters);

        default:
          return Failure(Exception(response.statusMessage));
      }
    } on DioException catch (e) {
      return Failure(e);
    }
  }
}
