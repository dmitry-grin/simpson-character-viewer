import 'package:simpsons_character_viewer/modules/character_viewer/domain/entities/character.dart';

class CharacterDetailArguments {
  CharacterDetailArguments(this.character, {this.searchTerm});

  final Character character;
  final String? searchTerm;
}