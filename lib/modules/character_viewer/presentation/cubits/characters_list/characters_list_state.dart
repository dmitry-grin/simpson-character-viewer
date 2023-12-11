import 'package:simpsons_character_viewer/modules/character_viewer/domain/entities/character.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'characters_list_state.freezed.dart';

@freezed
class CharactersListState with _$CharactersListState {
  const factory CharactersListState.loading() = Loading;

  const factory CharactersListState.loaded({
    required List<Character> allCharacters,
    @Default([]) List<Character> filteredCharacters,
    String? searchTerm,
  }) = Loaded;

  const factory CharactersListState.error() = Error;
}
