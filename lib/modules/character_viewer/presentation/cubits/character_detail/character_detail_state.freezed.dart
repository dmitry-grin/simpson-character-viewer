// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharactersDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Uint8List? imageData) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Uint8List? imageData)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Uint8List? imageData)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailLoading value) loading,
    required TResult Function(DetailLoaded value) loaded,
    required TResult Function(DetailError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailLoading value)? loading,
    TResult? Function(DetailLoaded value)? loaded,
    TResult? Function(DetailError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailLoading value)? loading,
    TResult Function(DetailLoaded value)? loaded,
    TResult Function(DetailError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharactersDetailStateCopyWith<$Res> {
  factory $CharactersDetailStateCopyWith(CharactersDetailState value,
          $Res Function(CharactersDetailState) then) =
      _$CharactersDetailStateCopyWithImpl<$Res, CharactersDetailState>;
}

/// @nodoc
class _$CharactersDetailStateCopyWithImpl<$Res,
        $Val extends CharactersDetailState>
    implements $CharactersDetailStateCopyWith<$Res> {
  _$CharactersDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DetailLoadingImplCopyWith<$Res> {
  factory _$$DetailLoadingImplCopyWith(
          _$DetailLoadingImpl value, $Res Function(_$DetailLoadingImpl) then) =
      __$$DetailLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailLoadingImplCopyWithImpl<$Res>
    extends _$CharactersDetailStateCopyWithImpl<$Res, _$DetailLoadingImpl>
    implements _$$DetailLoadingImplCopyWith<$Res> {
  __$$DetailLoadingImplCopyWithImpl(
      _$DetailLoadingImpl _value, $Res Function(_$DetailLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DetailLoadingImpl implements DetailLoading {
  const _$DetailLoadingImpl();

  @override
  String toString() {
    return 'CharactersDetailState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DetailLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Uint8List? imageData) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Uint8List? imageData)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Uint8List? imageData)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailLoading value) loading,
    required TResult Function(DetailLoaded value) loaded,
    required TResult Function(DetailError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailLoading value)? loading,
    TResult? Function(DetailLoaded value)? loaded,
    TResult? Function(DetailError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailLoading value)? loading,
    TResult Function(DetailLoaded value)? loaded,
    TResult Function(DetailError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DetailLoading implements CharactersDetailState {
  const factory DetailLoading() = _$DetailLoadingImpl;
}

/// @nodoc
abstract class _$$DetailLoadedImplCopyWith<$Res> {
  factory _$$DetailLoadedImplCopyWith(
          _$DetailLoadedImpl value, $Res Function(_$DetailLoadedImpl) then) =
      __$$DetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List? imageData});
}

/// @nodoc
class __$$DetailLoadedImplCopyWithImpl<$Res>
    extends _$CharactersDetailStateCopyWithImpl<$Res, _$DetailLoadedImpl>
    implements _$$DetailLoadedImplCopyWith<$Res> {
  __$$DetailLoadedImplCopyWithImpl(
      _$DetailLoadedImpl _value, $Res Function(_$DetailLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageData = freezed,
  }) {
    return _then(_$DetailLoadedImpl(
      imageData: freezed == imageData
          ? _value.imageData
          : imageData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$DetailLoadedImpl implements DetailLoaded {
  const _$DetailLoadedImpl({this.imageData});

  @override
  final Uint8List? imageData;

  @override
  String toString() {
    return 'CharactersDetailState.loaded(imageData: $imageData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadedImpl &&
            const DeepCollectionEquality().equals(other.imageData, imageData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(imageData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      __$$DetailLoadedImplCopyWithImpl<_$DetailLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Uint8List? imageData) loaded,
    required TResult Function() error,
  }) {
    return loaded(imageData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Uint8List? imageData)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(imageData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Uint8List? imageData)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(imageData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailLoading value) loading,
    required TResult Function(DetailLoaded value) loaded,
    required TResult Function(DetailError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailLoading value)? loading,
    TResult? Function(DetailLoaded value)? loaded,
    TResult? Function(DetailError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailLoading value)? loading,
    TResult Function(DetailLoaded value)? loaded,
    TResult Function(DetailError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DetailLoaded implements CharactersDetailState {
  const factory DetailLoaded({final Uint8List? imageData}) = _$DetailLoadedImpl;

  Uint8List? get imageData;
  @JsonKey(ignore: true)
  _$$DetailLoadedImplCopyWith<_$DetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailErrorImplCopyWith<$Res> {
  factory _$$DetailErrorImplCopyWith(
          _$DetailErrorImpl value, $Res Function(_$DetailErrorImpl) then) =
      __$$DetailErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailErrorImplCopyWithImpl<$Res>
    extends _$CharactersDetailStateCopyWithImpl<$Res, _$DetailErrorImpl>
    implements _$$DetailErrorImplCopyWith<$Res> {
  __$$DetailErrorImplCopyWithImpl(
      _$DetailErrorImpl _value, $Res Function(_$DetailErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DetailErrorImpl implements DetailError {
  const _$DetailErrorImpl();

  @override
  String toString() {
    return 'CharactersDetailState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DetailErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Uint8List? imageData) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Uint8List? imageData)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Uint8List? imageData)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailLoading value) loading,
    required TResult Function(DetailLoaded value) loaded,
    required TResult Function(DetailError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailLoading value)? loading,
    TResult? Function(DetailLoaded value)? loaded,
    TResult? Function(DetailError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailLoading value)? loading,
    TResult Function(DetailLoaded value)? loaded,
    TResult Function(DetailError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DetailError implements CharactersDetailState {
  const factory DetailError() = _$DetailErrorImpl;
}
