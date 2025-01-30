import 'package:flutter/material.dart';
import 'components/movie_details_component.dart';

class MovieDetailsView extends StatelessWidget {
   final int id;
   const MovieDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovieDetailsContent(),
    );
  }
}
