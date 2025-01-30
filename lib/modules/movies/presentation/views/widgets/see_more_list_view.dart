import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/movies/presentation/views/widgets/custom_see_more_item.dart';

import '../../../data/models/movie_model.dart';
import '../../controller/movie_bloc.dart';

class SeeMoreListView extends StatelessWidget {
  const SeeMoreListView({super.key, required this.moviesList});
  final List<MovieModel> moviesList;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount:moviesList.length,
            itemBuilder: (context, index) {
              final movie = moviesList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CustomSeeMoreItem(
                    movieModel: movie
                ),
              );
            },
          ),
        );
      },
    );
  }
}
