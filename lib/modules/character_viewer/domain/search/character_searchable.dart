import 'package:simpsons_character_viewer/app/domain/interface/accessor.dart';
import 'package:simpsons_character_viewer/app/domain/interface/searchable.dart';

abstract class CharacterSearchable implements Searchable {
  @override
  bool search(covariant CharacterAccessor accessor, String term);
}

abstract class CharacterAccessor extends Accessor {
  String get name;

  String get description;
}

class CharacterSearchableImpl implements CharacterSearchable {
  @override
  bool search(covariant CharacterAccessor accessor, String term) {
    return accessor.name.toLowerCase().contains(term.toLowerCase()) ||
        accessor.description.toLowerCase().contains(term.toLowerCase());
  }
}
