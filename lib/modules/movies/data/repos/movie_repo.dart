import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/modules/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/modules/movies/domain/entities/movie.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendations.dart';
import 'package:movies_app/modules/movies/domain/repos/base_movie_repo.dart';

class MovieRepo extends BaseMovieRepo{
  final BaseMovieRemoteDatasource baseMovieRemoteDatasource;

  MovieRepo(this.baseMovieRemoteDatasource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async{
    final result = baseMovieRemoteDatasource.getNowPlayingMovies();
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
   final result = await baseMovieRemoteDatasource.getPopularMovies();
   return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
   final result = await baseMovieRemoteDatasource.getTopRatedMovies();
    return result;
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieID) async {
    final result = await baseMovieRemoteDatasource.getMovieDetails(movieID);
    return result;
  }

  @override
  Future<Either<Failure, List<MovieRecommendations>>> getRecommendations(int movieID) async {
    final result = await baseMovieRemoteDatasource.getRecommendations(movieID);
    return result;
  }
}