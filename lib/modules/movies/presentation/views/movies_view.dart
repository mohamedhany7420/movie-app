import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/presentation/views/components/now_playing_component.dart';
import 'package:movies_app/modules/movies/presentation/views/components/popular_movies_component.dart';
import 'package:movies_app/modules/movies/presentation/views/components/top_rated_movies_component.dart';


class MovieView extends StatelessWidget {
  const MovieView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NowPlayingComponent(),
            PopularMoviesComponent(),
            TopRatedMoviesComponent(),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
