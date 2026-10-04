import 'package:bloc/bloc.dart';
import 'package:flutter_belajar/core/data/datasources/movie_remote_datasource.dart';
import 'package:flutter_belajar/core/data/models/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';
part 'movie_list_bloc.freezed.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieRemoteDatasource movieRemoteDatasource;
  MovieListBloc(this.movieRemoteDatasource) : super(_Initial()) {
    on<_FetchMovieList>((event, emit) async {
      emit(const MovieListState.loading());
      final result = await movieRemoteDatasource.getMovieList();
      result.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
