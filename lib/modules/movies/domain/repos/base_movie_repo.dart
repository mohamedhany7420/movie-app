import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/modules/movies/domain/entities/movie.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendations.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieID);
  Future<Either<Failure, List<MovieRecommendations>>> getRecommendations(int movieID);

}