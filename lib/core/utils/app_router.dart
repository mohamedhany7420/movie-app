import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/service_locater.dart';
import 'package:movies_app/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/modules/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/modules/movies/presentation/views/movie_details_view.dart';
import 'package:movies_app/modules/movies/presentation/views/popular_view.dart';
import 'package:movies_app/modules/movies/presentation/views/top_rated_view.dart';
import 'package:movies_app/modules/splash/presentation/splash_view.dart';

import '../../modules/movies/presentation/views/movies_view.dart';


abstract class AppRouter{
  static final router =GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashView();
          },
        ),
        GoRoute(
          path: '/movieView',
          builder: (BuildContext context, GoRouterState state) {
            return const MovieView();
          },
        ),
        GoRoute(
          path: '/movieDetails',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
                create: (context) => getIt<MovieDetailsBloc>()..add(GetMovieDetailsEvent(state.extra as int ))..add(GetMovieRecommendationsEvent(state.extra as int)),
                lazy: false,
                child:  MovieDetailsView(id: state.extra as int
                )
            );
          },
        ),
        GoRoute(
          path: '/popularView',
          builder: (BuildContext context, GoRouterState state) {
            return PopularView(moviesList: state.extra as List<MovieModel> );
          },
        ),
        GoRoute(
          path: '/topRatedView',
          builder: (BuildContext context, GoRouterState state) {
            return TopRatedView(moviesList: state.extra as List<MovieModel> );
          },
        ),
      ]
  );
}