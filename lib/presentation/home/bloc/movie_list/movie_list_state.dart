part of 'movie_list_bloc.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.initial() = _Initial;
  const factory MovieListState.loading() = _Loading;
  const factory MovieListState.success(MovieModelResponse movieModelResponse) =
      _Success;
  const factory MovieListState.error(String message) = _Error;
}
