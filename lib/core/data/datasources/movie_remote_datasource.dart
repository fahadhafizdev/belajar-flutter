import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_belajar/core/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDatasource {
  Future<Either<String, MovieModelResponse>> getMovieList() async {
    log("Fetching movie list from remote datasource");
    final uri = Uri.parse("https://api.themoviedb.org/3/movie/now_playing")
        .replace(queryParameters: {'language': 'en-US', 'page': '1'});
    String token =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNmIxYWI0NDBiMGEyNWRjMWM4NzdjOTJiYjk5YmM4MyIsIm5iZiI6MTc5MDc4MzAyMy43NTQsInN1YiI6IjZhYmQyZTJmNDZhZDc3Yjg0ZGZkNGM0NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QDBOnX5XVtNiAVb8nt6isKu7Wao29Uh3fU6OVlf3dXE";

    final response = await http.get(
      uri,
      headers: {"Authorization": "Bearer $token", 'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      log("Movie list fetched successfully");
      log("Response body: ${response.body}");
      final movieResponse = MovieModelResponse.fromJson(
        json.decode(response.body),
      );
      return Right(movieResponse);
    } else {
      return Left("Failed to fetch movie list ${response.reasonPhrase}");
    }
  }
}
