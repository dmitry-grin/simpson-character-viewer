import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/app/network/result.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/data/characters_detail_data_source.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/routes/character_detail_arguments.dart';

part 'character_detail_state.dart';

class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  CharacterDetailCubit({
    required CharacterDetailDataSource characterDetailDataSource,
    required CharacterDetailArguments arguments,
  })  : _characterDetailDataSource = characterDetailDataSource,
        super(CharacterDetailInitial(arguments));

  final CharacterDetailDataSource _characterDetailDataSource;

  void loadImage() async {
    if (state.arguments.character.icon.url.isEmpty) {
      return emit(CharacterDetailLoaded(state.arguments));
    }

    emit(CharacterDetailLoading(state.arguments));

    final result = await _characterDetailDataSource.loadImage(state.arguments.character.icon.url);

    switch (result) {
      case Success(value: final image):
        emit(CharacterDetailLoaded(state.arguments, imageData: image));
      case Failure(exception: _):
        emit(CharacterDetailError(state.arguments));
    }
  }
}
