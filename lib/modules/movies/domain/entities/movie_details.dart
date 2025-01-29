import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable{
  final String? backdropPath;
  final int id;
  final List<Genres>? genres;
  final String? overview;
  final String? releaseDate;
  final String? title;
  final num? voteAverage;
  final num? runTime;

  const MovieDetails(
      {
        required this.backdropPath,
        required this.genres,
        required this.id,
        required this.runTime,
        required this.overview,
        required this.releaseDate,
        required this.voteAverage,
        required this.title
      });

  @override
  List<Object?> get props => [
    backdropPath,
    genres,
    id,
    runTime,
    overview,
    releaseDate,
    voteAverage,
    title
  ];
}