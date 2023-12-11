import 'package:simpsons_character_viewer/modules/character_viewer/domain/search/character_searchable.dart';

/// Contains metadata of Simpson Character
class Character implements CharacterAccessor {
  final String firstURL;
  final Icon icon;
  final String result;
  final String text;

  @override
  final String name;

  @override
  String get description => text;

  Character({
    required this.firstURL,
    required this.icon,
    required this.result,
    required this.text,
    required this.name,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    final name = json['Text'] as String;
    final nameComponents = name.split('-');

    return Character(
      firstURL: json['FirstURL'],
      icon: Icon.fromJson(json['Icon']),
      result: json['Result'],
      text: json['Text'],
      name: nameComponents.first,
    );
  }
}

class Icon {
  final String height;
  final String url;
  final String width;

  Icon({
    required this.height,
    required this.url,
    required this.width,
  });

  factory Icon.fromJson(Map<String, dynamic> json) {
    return Icon(
      height: json['Height'],
      url: json['URL'],
      width: json['Width'],
    );
  }
}
