// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OverviewState _$OverviewStateFromJson(Map<String, dynamic> json) {
  return _OverviewState.fromJson(json);
}

/// @nodoc
mixin _$OverviewState {
  List<HotelEntity> get hotels => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasReachedEnd => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;

  /// Serializes this OverviewState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OverviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OverviewStateCopyWith<OverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewStateCopyWith<$Res> {
  factory $OverviewStateCopyWith(
          OverviewState value, $Res Function(OverviewState) then) =
      _$OverviewStateCopyWithImpl<$Res, OverviewState>;
  @useResult
  $Res call(
      {List<HotelEntity> hotels,
      String error,
      bool isLoading,
      bool isLoadingMore,
      int currentPage,
      bool hasReachedEnd,
      String searchQuery});
}

/// @nodoc
class _$OverviewStateCopyWithImpl<$Res, $Val extends OverviewState>
    implements $OverviewStateCopyWith<$Res> {
  _$OverviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OverviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotels = null,
    Object? error = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? currentPage = null,
    Object? hasReachedEnd = null,
    Object? searchQuery = null,
  }) {
    return _then(_value.copyWith(
      hotels: null == hotels
          ? _value.hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<HotelEntity>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OverviewStateImplCopyWith<$Res>
    implements $OverviewStateCopyWith<$Res> {
  factory _$$OverviewStateImplCopyWith(
          _$OverviewStateImpl value, $Res Function(_$OverviewStateImpl) then) =
      __$$OverviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HotelEntity> hotels,
      String error,
      bool isLoading,
      bool isLoadingMore,
      int currentPage,
      bool hasReachedEnd,
      String searchQuery});
}

/// @nodoc
class __$$OverviewStateImplCopyWithImpl<$Res>
    extends _$OverviewStateCopyWithImpl<$Res, _$OverviewStateImpl>
    implements _$$OverviewStateImplCopyWith<$Res> {
  __$$OverviewStateImplCopyWithImpl(
      _$OverviewStateImpl _value, $Res Function(_$OverviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OverviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hotels = null,
    Object? error = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? currentPage = null,
    Object? hasReachedEnd = null,
    Object? searchQuery = null,
  }) {
    return _then(_$OverviewStateImpl(
      hotels: null == hotels
          ? _value._hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<HotelEntity>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OverviewStateImpl extends _OverviewState {
  const _$OverviewStateImpl(
      {required final List<HotelEntity> hotels,
      required this.error,
      required this.isLoading,
      required this.isLoadingMore,
      required this.currentPage,
      required this.hasReachedEnd,
      required this.searchQuery})
      : _hotels = hotels,
        super._();

  factory _$OverviewStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OverviewStateImplFromJson(json);

  final List<HotelEntity> _hotels;
  @override
  List<HotelEntity> get hotels {
    if (_hotels is EqualUnmodifiableListView) return _hotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotels);
  }

  @override
  final String error;
  @override
  final bool isLoading;
  @override
  final bool isLoadingMore;
  @override
  final int currentPage;
  @override
  final bool hasReachedEnd;
  @override
  final String searchQuery;

  @override
  String toString() {
    return 'OverviewState(hotels: $hotels, error: $error, isLoading: $isLoading, isLoadingMore: $isLoadingMore, currentPage: $currentPage, hasReachedEnd: $hasReachedEnd, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverviewStateImpl &&
            const DeepCollectionEquality().equals(other._hotels, _hotels) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasReachedEnd, hasReachedEnd) ||
                other.hasReachedEnd == hasReachedEnd) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hotels),
      error,
      isLoading,
      isLoadingMore,
      currentPage,
      hasReachedEnd,
      searchQuery);

  /// Create a copy of OverviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OverviewStateImplCopyWith<_$OverviewStateImpl> get copyWith =>
      __$$OverviewStateImplCopyWithImpl<_$OverviewStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OverviewStateImplToJson(
      this,
    );
  }
}

abstract class _OverviewState extends OverviewState {
  const factory _OverviewState(
      {required final List<HotelEntity> hotels,
      required final String error,
      required final bool isLoading,
      required final bool isLoadingMore,
      required final int currentPage,
      required final bool hasReachedEnd,
      required final String searchQuery}) = _$OverviewStateImpl;
  const _OverviewState._() : super._();

  factory _OverviewState.fromJson(Map<String, dynamic> json) =
      _$OverviewStateImpl.fromJson;

  @override
  List<HotelEntity> get hotels;
  @override
  String get error;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  int get currentPage;
  @override
  bool get hasReachedEnd;
  @override
  String get searchQuery;

  /// Create a copy of OverviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OverviewStateImplCopyWith<_$OverviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
