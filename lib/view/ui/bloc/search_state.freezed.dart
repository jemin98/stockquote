// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StockState {
  bool get isLoading => throw _privateConstructorUsedError;
  StockSearchResponse? get stockSearchResponse =>
      throw _privateConstructorUsedError;
  StockDetailsResponse? get stockDetailsResponse =>
      throw _privateConstructorUsedError;
  StockPriceResponse? get stockPriceResponse =>
      throw _privateConstructorUsedError;
  List<StockDetailsResponse>? get categoryWiseStocks =>
      throw _privateConstructorUsedError;
  List<ChartData>? get chartData => throw _privateConstructorUsedError;
  List<Result>? get watchlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockStateCopyWith<StockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockStateCopyWith<$Res> {
  factory $StockStateCopyWith(
          StockState value, $Res Function(StockState) then) =
      _$StockStateCopyWithImpl<$Res, StockState>;
  @useResult
  $Res call(
      {bool isLoading,
      StockSearchResponse? stockSearchResponse,
      StockDetailsResponse? stockDetailsResponse,
      StockPriceResponse? stockPriceResponse,
      List<StockDetailsResponse>? categoryWiseStocks,
      List<ChartData>? chartData,
      List<Result>? watchlist});
}

/// @nodoc
class _$StockStateCopyWithImpl<$Res, $Val extends StockState>
    implements $StockStateCopyWith<$Res> {
  _$StockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? stockSearchResponse = freezed,
    Object? stockDetailsResponse = freezed,
    Object? stockPriceResponse = freezed,
    Object? categoryWiseStocks = freezed,
    Object? chartData = freezed,
    Object? watchlist = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      stockSearchResponse: freezed == stockSearchResponse
          ? _value.stockSearchResponse
          : stockSearchResponse // ignore: cast_nullable_to_non_nullable
              as StockSearchResponse?,
      stockDetailsResponse: freezed == stockDetailsResponse
          ? _value.stockDetailsResponse
          : stockDetailsResponse // ignore: cast_nullable_to_non_nullable
              as StockDetailsResponse?,
      stockPriceResponse: freezed == stockPriceResponse
          ? _value.stockPriceResponse
          : stockPriceResponse // ignore: cast_nullable_to_non_nullable
              as StockPriceResponse?,
      categoryWiseStocks: freezed == categoryWiseStocks
          ? _value.categoryWiseStocks
          : categoryWiseStocks // ignore: cast_nullable_to_non_nullable
              as List<StockDetailsResponse>?,
      chartData: freezed == chartData
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<ChartData>?,
      watchlist: freezed == watchlist
          ? _value.watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $StockStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      StockSearchResponse? stockSearchResponse,
      StockDetailsResponse? stockDetailsResponse,
      StockPriceResponse? stockPriceResponse,
      List<StockDetailsResponse>? categoryWiseStocks,
      List<ChartData>? chartData,
      List<Result>? watchlist});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$StockStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? stockSearchResponse = freezed,
    Object? stockDetailsResponse = freezed,
    Object? stockPriceResponse = freezed,
    Object? categoryWiseStocks = freezed,
    Object? chartData = freezed,
    Object? watchlist = freezed,
  }) {
    return _then(_$SearchStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      stockSearchResponse: freezed == stockSearchResponse
          ? _value.stockSearchResponse
          : stockSearchResponse // ignore: cast_nullable_to_non_nullable
              as StockSearchResponse?,
      stockDetailsResponse: freezed == stockDetailsResponse
          ? _value.stockDetailsResponse
          : stockDetailsResponse // ignore: cast_nullable_to_non_nullable
              as StockDetailsResponse?,
      stockPriceResponse: freezed == stockPriceResponse
          ? _value.stockPriceResponse
          : stockPriceResponse // ignore: cast_nullable_to_non_nullable
              as StockPriceResponse?,
      categoryWiseStocks: freezed == categoryWiseStocks
          ? _value._categoryWiseStocks
          : categoryWiseStocks // ignore: cast_nullable_to_non_nullable
              as List<StockDetailsResponse>?,
      chartData: freezed == chartData
          ? _value._chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<ChartData>?,
      watchlist: freezed == watchlist
          ? _value._watchlist
          : watchlist // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl extends _SearchState {
  const _$SearchStateImpl(
      {this.isLoading = false,
      this.stockSearchResponse,
      this.stockDetailsResponse,
      this.stockPriceResponse,
      final List<StockDetailsResponse>? categoryWiseStocks,
      final List<ChartData>? chartData,
      final List<Result>? watchlist})
      : _categoryWiseStocks = categoryWiseStocks,
        _chartData = chartData,
        _watchlist = watchlist,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final StockSearchResponse? stockSearchResponse;
  @override
  final StockDetailsResponse? stockDetailsResponse;
  @override
  final StockPriceResponse? stockPriceResponse;
  final List<StockDetailsResponse>? _categoryWiseStocks;
  @override
  List<StockDetailsResponse>? get categoryWiseStocks {
    final value = _categoryWiseStocks;
    if (value == null) return null;
    if (_categoryWiseStocks is EqualUnmodifiableListView)
      return _categoryWiseStocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ChartData>? _chartData;
  @override
  List<ChartData>? get chartData {
    final value = _chartData;
    if (value == null) return null;
    if (_chartData is EqualUnmodifiableListView) return _chartData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Result>? _watchlist;
  @override
  List<Result>? get watchlist {
    final value = _watchlist;
    if (value == null) return null;
    if (_watchlist is EqualUnmodifiableListView) return _watchlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StockState(isLoading: $isLoading, stockSearchResponse: $stockSearchResponse, stockDetailsResponse: $stockDetailsResponse, stockPriceResponse: $stockPriceResponse, categoryWiseStocks: $categoryWiseStocks, chartData: $chartData, watchlist: $watchlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.stockSearchResponse, stockSearchResponse) ||
                other.stockSearchResponse == stockSearchResponse) &&
            (identical(other.stockDetailsResponse, stockDetailsResponse) ||
                other.stockDetailsResponse == stockDetailsResponse) &&
            (identical(other.stockPriceResponse, stockPriceResponse) ||
                other.stockPriceResponse == stockPriceResponse) &&
            const DeepCollectionEquality()
                .equals(other._categoryWiseStocks, _categoryWiseStocks) &&
            const DeepCollectionEquality()
                .equals(other._chartData, _chartData) &&
            const DeepCollectionEquality()
                .equals(other._watchlist, _watchlist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      stockSearchResponse,
      stockDetailsResponse,
      stockPriceResponse,
      const DeepCollectionEquality().hash(_categoryWiseStocks),
      const DeepCollectionEquality().hash(_chartData),
      const DeepCollectionEquality().hash(_watchlist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState extends StockState {
  const factory _SearchState(
      {final bool isLoading,
      final StockSearchResponse? stockSearchResponse,
      final StockDetailsResponse? stockDetailsResponse,
      final StockPriceResponse? stockPriceResponse,
      final List<StockDetailsResponse>? categoryWiseStocks,
      final List<ChartData>? chartData,
      final List<Result>? watchlist}) = _$SearchStateImpl;
  const _SearchState._() : super._();

  @override
  bool get isLoading;
  @override
  StockSearchResponse? get stockSearchResponse;
  @override
  StockDetailsResponse? get stockDetailsResponse;
  @override
  StockPriceResponse? get stockPriceResponse;
  @override
  List<StockDetailsResponse>? get categoryWiseStocks;
  @override
  List<ChartData>? get chartData;
  @override
  List<Result>? get watchlist;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
