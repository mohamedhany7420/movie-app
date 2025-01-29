import 'package:movies_app/modules/movies/data/models/genres_model.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails{
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.runTime,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.title});
  factory MovieDetailsModel.fromJson(Map<String,dynamic> json) => MovieDetailsModel(
          backdropPath: json['backdrop_path'],
          genres: List<GenresModel>.from(json['genres'].map( (e) => GenresModel.fromJson(e)
          )),
          id: json['id'],
          runTime: json['runtime'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          voteAverage: json["vote_average"],
      title: json['title']
      );
}