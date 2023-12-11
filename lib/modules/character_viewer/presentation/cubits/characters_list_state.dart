part of 'characters_list_cubit.dart';

abstract class CharactersListState {}

class CharactersListInitial implements CharactersListState {}

class CharactersListLoading implements CharactersListState {}

class CharactersListLoaded implements CharactersListState {
  const CharactersListLoaded(
    this.allCharacters, {
    this.filteredCharacters = const [],
    this.searchTerm,
  });

  final List<Character> allCharacters;
  final List<Character> filteredCharacters;
  final String? searchTerm;

  @override
  String toString() {
    return 'CharactersListLoaded State:'
        '\nallCharacters: ${allCharacters.length}'
        '\nfilteredCharacters: ${filteredCharacters.length}'
        '\nsearchTerm: $searchTerm';
  }
}

class CharactersListError implements CharactersListState {}
