import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_detail_state.freezed.dart';

@freezed
class CharactersDetailState with _$CharactersDetailState {
  const factory CharactersDetailState.loading() = DetailLoading;

  const factory CharactersDetailState.loaded({
    Uint8List? imageData,
  }) = DetailLoaded;

  const factory CharactersDetailState.error() = DetailError;
}
