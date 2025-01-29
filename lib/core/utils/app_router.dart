import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/service_locater.dart';
import 'package:movies_app/modules/movies/presentation/controller/movie_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/modules/movies/presentation/views/movie_details_view.dart';

import '../../modules/movies/presentation/views/movies_view.dart';


abstract class AppRouter{
  static final router =GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              lazy:  false,
              create: (context) => getIt<MovieBloc>()..add(GetNowPlayingEvent())..add(GetPopularEvent())..add(GetTopRatedEvent()),
                child: const MovieView());
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
      ]
  );
}