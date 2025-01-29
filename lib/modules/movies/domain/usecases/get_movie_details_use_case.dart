
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_details.dart';
import 'package:movies_app/modules/movies/domain/repos/base_movie_repo.dart';

class GetMovieDetailsUseCase extends BaseUsecase<MovieDetails, int>{
  final BaseMovieRepo baseMovieRepo;
  GetMovieDetailsUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure,MovieDetails>>call (int parameters) async{
    return await baseMovieRepo.getMovieDetails(parameters);
  }
}