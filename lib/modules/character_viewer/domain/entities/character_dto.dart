/// Contains metadata of Simpson Character
class CharacterDto {
  final String firstURL;
  final Icon icon;
  final String result;
  final String text;

  CharacterDto({
    required this.firstURL,
    required this.icon,
    required this.result,
    required this.text,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) {
    return CharacterDto(
      firstURL: json['FirstURL'],
      icon: Icon.fromJson(json['Icon']),
      result: json['Result'],
      text: json['Text'],
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
