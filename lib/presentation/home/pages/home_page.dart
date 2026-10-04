import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_belajar/core/constants/colors.dart';
import 'package:flutter_belajar/core/core.dart';
import 'package:flutter_belajar/presentation/home/bloc/movie_list/movie_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert';
import 'dart:developer';

import 'card_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  initState() {
    context.read<MovieListBloc>().add(MovieListEvent.fetchMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpaceHeight(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Movie Catalog',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.search, color: AppColors.white),
                ],
              ),
            ),
            SpaceHeight(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Movies',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'SEE ALL',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SpaceHeight(20),
            BlocBuilder<MovieListBloc, MovieListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  success: (movieList) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SpaceWidth(24),
                          for (var movie in movieList.results!)
                            CardMovie(movie: movie),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            SpaceHeight(34),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular this week',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'SEE ALL',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SpaceHeight(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpaceWidth(24),
                  // CardMovie(),
                  // CardMovie(),
                  // CardMovie(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
