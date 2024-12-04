// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainScreenUiState {
  ImageState? get imageState => throw _privateConstructorUsedError;
  dynamic get isLoading => throw _privateConstructorUsedError;
  Loading? get loading => throw _privateConstructorUsedError;
  dynamic get currentPageIndex => throw _privateConstructorUsedError;
  List<SavedItem> get savedList => throw _privateConstructorUsedError;

  /// Create a copy of MainScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainScreenUiStateCopyWith<MainScreenUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenUiStateCopyWith<$Res> {
  factory $MainScreenUiStateCopyWith(
          MainScreenUiState value, $Res Function(MainScreenUiState) then) =
      _$MainScreenUiStateCopyWithImpl<$Res, MainScreenUiState>;
  @useResult
  $Res call(
      {ImageState? imageState,
      dynamic isLoading,
      Loading? loading,
      dynamic currentPageIndex,
      List<SavedItem> savedList});
}

/// @nodoc
class _$MainScreenUiStateCopyWithImpl<$Res, $Val extends MainScreenUiState>
    implements $MainScreenUiStateCopyWith<$Res> {
  _$MainScreenUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageState = freezed,
    Object? isLoading = freezed,
    Object? loading = freezed,
    Object? currentPageIndex = freezed,
    Object? savedList = null,
  }) {
    return _then(_value.copyWith(
      imageState: freezed == imageState
          ? _value.imageState
          : imageState // ignore: cast_nullable_to_non_nullable
              as ImageState?,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as Loading?,
      currentPageIndex: freezed == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      savedList: null == savedList
          ? _value.savedList
          : savedList // ignore: cast_nullable_to_non_nullable
              as List<SavedItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainScreenUiStateImplCopyWith<$Res>
    implements $MainScreenUiStateCopyWith<$Res> {
  factory _$$MainScreenUiStateImplCopyWith(_$MainScreenUiStateImpl value,
          $Res Function(_$MainScreenUiStateImpl) then) =
      __$$MainScreenUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ImageState? imageState,
      dynamic isLoading,
      Loading? loading,
      dynamic currentPageIndex,
      List<SavedItem> savedList});
}

/// @nodoc
class __$$MainScreenUiStateImplCopyWithImpl<$Res>
    extends _$MainScreenUiStateCopyWithImpl<$Res, _$MainScreenUiStateImpl>
    implements _$$MainScreenUiStateImplCopyWith<$Res> {
  __$$MainScreenUiStateImplCopyWithImpl(_$MainScreenUiStateImpl _value,
      $Res Function(_$MainScreenUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageState = freezed,
    Object? isLoading = freezed,
    Object? loading = freezed,
    Object? currentPageIndex = freezed,
    Object? savedList = null,
  }) {
    return _then(_$MainScreenUiStateImpl(
      imageState: freezed == imageState
          ? _value.imageState
          : imageState // ignore: cast_nullable_to_non_nullable
              as ImageState?,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as Loading?,
      currentPageIndex: freezed == currentPageIndex
          ? _value.currentPageIndex!
          : currentPageIndex,
      savedList: null == savedList
          ? _value._savedList
          : savedList // ignore: cast_nullable_to_non_nullable
              as List<SavedItem>,
    ));
  }
}

/// @nodoc

class _$MainScreenUiStateImpl implements _MainScreenUiState {
  const _$MainScreenUiStateImpl(
      {required this.imageState,
      this.isLoading = false,
      required this.loading,
      this.currentPageIndex = 0,
      final List<SavedItem> savedList = const []})
      : _savedList = savedList;

  @override
  final ImageState? imageState;
  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  final Loading? loading;
  @override
  @JsonKey()
  final dynamic currentPageIndex;
  final List<SavedItem> _savedList;
  @override
  @JsonKey()
  List<SavedItem> get savedList {
    if (_savedList is EqualUnmodifiableListView) return _savedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedList);
  }

  @override
  String toString() {
    return 'MainScreenUiState(imageState: $imageState, isLoading: $isLoading, loading: $loading, currentPageIndex: $currentPageIndex, savedList: $savedList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainScreenUiStateImpl &&
            (identical(other.imageState, imageState) ||
                other.imageState == imageState) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other.currentPageIndex, currentPageIndex) &&
            const DeepCollectionEquality()
                .equals(other._savedList, _savedList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      imageState,
      const DeepCollectionEquality().hash(isLoading),
      loading,
      const DeepCollectionEquality().hash(currentPageIndex),
      const DeepCollectionEquality().hash(_savedList));

  /// Create a copy of MainScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainScreenUiStateImplCopyWith<_$MainScreenUiStateImpl> get copyWith =>
      __$$MainScreenUiStateImplCopyWithImpl<_$MainScreenUiStateImpl>(
          this, _$identity);
}

abstract class _MainScreenUiState implements MainScreenUiState {
  const factory _MainScreenUiState(
      {required final ImageState? imageState,
      final dynamic isLoading,
      required final Loading? loading,
      final dynamic currentPageIndex,
      final List<SavedItem> savedList}) = _$MainScreenUiStateImpl;

  @override
  ImageState? get imageState;
  @override
  dynamic get isLoading;
  @override
  Loading? get loading;
  @override
  dynamic get currentPageIndex;
  @override
  List<SavedItem> get savedList;

  /// Create a copy of MainScreenUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainScreenUiStateImplCopyWith<_$MainScreenUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}