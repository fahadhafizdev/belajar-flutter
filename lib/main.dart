import 'package:flutter/material.dart';
import 'package:flutter_belajar/core/data/datasources/movie_remote_datasource.dart';
import 'package:flutter_belajar/presentation/home/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'presentation/home/bloc/movie_list/movie_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieListBloc(MovieRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          dividerTheme: DividerThemeData(
            color: AppColors.light.withOpacity(0.5),
          ),

          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: AppColors.white,
            elevation: 0,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
