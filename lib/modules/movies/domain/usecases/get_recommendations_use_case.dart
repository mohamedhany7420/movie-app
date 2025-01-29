
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendations.dart';
import 'package:movies_app/modules/movies/domain/repos/base_movie_repo.dart';

class GetRecommendationsUseCase extends BaseUsecase<List<MovieRecommendations>, int>{
  final BaseMovieRepo baseMovieRepo;
  GetRecommendationsUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure,List<MovieRecommendations>>> call(int parameters) async{
    return await baseMovieRepo.getRecommendations(parameters);
  }
}