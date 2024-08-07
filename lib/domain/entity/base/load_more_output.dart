import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/shared.dart';

part 'load_more_output.freezed.dart';

@freezed
class LoadMoreOutput<T> with _$LoadMoreOutput<T> {
  const LoadMoreOutput._();

  const factory LoadMoreOutput({
    required List<T> data,
    @Default(null) Object? otherData,
    @Default(Constants.initialPage) int page,
    @Default(false) bool isRefreshSuccess,
    @Default(0) int offset,
    @Default(false) bool isLastPage,
  }) = _LoadMoreOutput;

  int get nextPage => page + 1;
  int get previousPage => page - 1;
}
