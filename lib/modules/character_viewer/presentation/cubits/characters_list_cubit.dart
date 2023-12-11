import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/app/network/result.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/data/characters_data_source.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/domain/entities/character.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/domain/search/character_searchable.dart';

part 'characters_list_state.dart';

class CharactersListCubit extends Cubit<CharactersListState> {
  CharactersListCubit({
    required CharactersDataSource charactersDataSource,
    required CharacterSearchable characterSearchable,
  })  : _charactersDataSource = charactersDataSource,
        _characterSearchable = characterSearchable,
        super(CharactersListInitial());

  final CharactersDataSource _charactersDataSource;
  final CharacterSearchable _characterSearchable;

  void fetchCharacters() async {
    emit(CharactersListLoading());

    final result = await _charactersDataSource.fetchCharacters();

    switch (result) {
      case Success(value: final characters):
        emit(CharactersListLoaded(characters));
      case Failure(exception: _):
        emit(CharactersListError());
    }
  }

  void search({required String term}) {
    if (state is CharactersListLoaded) {
      final currentState = state as CharactersListLoaded;

      final filteredCharacters = currentState.allCharacters.where(
            (character) => _characterSearchable.search(character, term),
          ).toList();

      emit(
        CharactersListLoaded(
          currentState.allCharacters,
          filteredCharacters: filteredCharacters,
          searchTerm: term,
        ),
      );
    }
  }

  void cancelSearch() {
    if (state is CharactersListLoaded) {
      final currentState = state as CharactersListLoaded;

      emit(
        CharactersListLoaded(
          currentState.allCharacters,
          filteredCharacters: [],
        ),
      );
    }
  }
}
