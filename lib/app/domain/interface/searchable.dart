import 'package:simpsons_character_viewer/app/domain/interface/accessor.dart';

abstract class Searchable {
  bool search(Accessor accessor, String term);
}