part of 'movie_list_bloc.dart';

@freezed
class MovieListEvent with _$MovieListEvent {
  const factory MovieListEvent.started() = _Started;
  const factory MovieListEvent.fetchMovieList() = _FetchMovieList;
}
