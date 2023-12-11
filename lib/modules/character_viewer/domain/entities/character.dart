import 'package:simpsons_character_viewer/modules/character_viewer/domain/entities/character_dto.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/domain/search/character_searchable.dart';

/// Represents individual Simpson character with name, description, and URL information.
class Character implements CharacterAccessor {
  @override
  final String name;

  @override
  final String description;

  final String url;

  Character({
    required this.name,
    required this.description,
    required this.url,
  });

  factory Character.from(CharacterDto dto) {
    final nameComponents = dto.text.split('-');

    return Character(
      name: nameComponents.isNotEmpty ? nameComponents.first : 'Generic Bart Simpson',
      description: dto.text,
      url: dto.icon.url,
    );
  }
}
