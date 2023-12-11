part of 'character_detail_cubit.dart';

abstract class CharacterDetailState {
  const CharacterDetailState(this.arguments);

  final CharacterDetailArguments arguments;
}

class CharacterDetailInitial extends CharacterDetailState {
  CharacterDetailInitial(super.arguments);
}

class CharacterDetailLoading extends CharacterDetailState {
  CharacterDetailLoading(super.arguments);
}

class CharacterDetailLoaded extends CharacterDetailState {
  CharacterDetailLoaded(
    super.arguments, {
    this.imageData,
  });

  final Uint8List? imageData;
}

class CharacterDetailError extends CharacterDetailState {
  CharacterDetailError(super.arguments);
}
