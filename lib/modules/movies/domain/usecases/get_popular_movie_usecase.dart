import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/modules/movies/domain/entities/movie.dart';
import 'package:movies_app/modules/movies/domain/repos/base_movie_repo.dart';

class GetPopularMovieUsecase extends BaseUsecase<List<Movie>, NoParameters>{
  final BaseMovieRepo baseMovieRepo;
  GetPopularMovieUsecase(this.baseMovieRepo);
  @override
  Future<Either<Failure,List<Movie>>>call (NoParameters parameters) async{
    return await baseMovieRepo.getPopularMovies();
  }
}