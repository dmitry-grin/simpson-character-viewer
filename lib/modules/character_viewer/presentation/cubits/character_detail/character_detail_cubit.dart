import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/app/network/result.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/data/characters_detail_data_source.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/domain/entities/character.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/cubits/character_detail/character_detail_state.dart';


class CharacterDetailCubit extends Cubit<CharactersDetailState> {
  CharacterDetailCubit({
    required CharacterDetailDataSource characterDetailDataSource,
  })  : _characterDetailDataSource = characterDetailDataSource,
        super(const CharactersDetailState.loading());

  final CharacterDetailDataSource _characterDetailDataSource;

  void loadImageFor({required Character character}) async {
    if (character.url.isEmpty) {
      return emit(const CharactersDetailState.loaded());
    }

    emit(const CharactersDetailState.loading());

    final result = await _characterDetailDataSource.loadImage(character.url);

    switch (result) {
      case Success(value: final image):
        emit(CharactersDetailState.loaded(imageData: image));
      case Failure(exception: _):
        emit(const CharactersDetailState.error());
    }
  }
}
