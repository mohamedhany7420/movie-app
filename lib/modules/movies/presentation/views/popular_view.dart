import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/presentation/views/widgets/see_more_list_view.dart';

import '../../data/models/movie_model.dart';

class PopularView extends StatelessWidget {
  const PopularView({super.key, required this.moviesList});
   final List<MovieModel> moviesList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Popular Movies',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
                  ),
        ),
        body: SeeMoreListView(moviesList:moviesList),
      ),
    );
  }
}
