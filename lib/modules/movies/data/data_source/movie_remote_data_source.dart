import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/api_service.dart';
import 'package:movies_app/modules/movies/data/models/movie_details_model.dart';
import 'package:movies_app/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/modules/movies/data/models/movie_recommendations_model.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendations.dart';

abstract class BaseMovieRemoteDatasource{
  Future<Either<Failure,List<MovieModel>>> getNowPlayingMovies();

  Future<Either<Failure,List<MovieModel>>> getPopularMovies();

  Future<Either<Failure,List<MovieModel>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetails>> getMovieDetails(int movieID);

  Future<Either<Failure,List<MovieRecommendations>>> getRecommendations(int movieID);
}
class MovieRemoteDataSource extends BaseMovieRemoteDatasource{
  ApiService apiService;
  MovieRemoteDataSource(this.apiService);
  @override
  Future<Either<Failure,List<MovieModel>>> getNowPlayingMovies() async{
    try {
      final data = await apiService.get(endpoint: ApiConstants.getNowPlayingMoviesEndpoint);
      List<MovieModel> movies = [];
      for(var item in data['results']){
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,List<MovieModel>>> getPopularMovies() async{
    try {
      final data = await apiService.get(endpoint: ApiConstants.getPopularMoviesEndpoint);
      List<MovieModel> movies = [];
      for(var item in data['results']){
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,List<MovieModel>>> getTopRatedMovies() async{
    try {
      final data = await apiService.get(endpoint: ApiConstants.getTopRatedMoviesEndpoint);
      List<MovieModel> movies = [];
      for(var item in data['results']){
        movies.add(MovieModel.fromJson(item));
      }
      return right(movies);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieID) async{
    try {
      final data = await apiService.get(endpoint: ApiConstants.movieDetailsEndPoint(movieID));
      return right(MovieDetailsModel.fromJson(data));
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendations>>> getRecommendations(int movieID) async{
    try {
      final data = await apiService.get(endpoint: ApiConstants.recommendationsEndPoint(movieID));
      List<MovieRecommendations> recommendations = [];
      for(var item in data['results']){
        recommendations.add(MovieRecommendationsModel.fromJson(item));
      }
      return right(recommendations);
    } catch (e) {
      if(e is DioException){
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}