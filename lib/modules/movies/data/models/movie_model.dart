import 'package:movies_app/modules/movies/domain/entities/movie.dart';

class MovieModel extends Movie{
  const MovieModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage
  });
  factory MovieModel.fromJson(Map<String,dynamic> json) =>MovieModel(
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e)=> (e))),
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average']
  );
}