import 'package:simpsons_character_viewer/app/interface/accessor.dart';

abstract class Searchable {
  bool search(Accessor accessor, String term);
}