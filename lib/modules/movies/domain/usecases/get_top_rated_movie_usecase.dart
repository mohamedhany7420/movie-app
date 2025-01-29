import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/modules/movies/domain/entities/movie.dart';
import 'package:movies_app/modules/movies/domain/repos/base_movie_repo.dart';

import '../../../../core/usecase/base_usecase.dart';

class GetTopRatedMovieUsecase extends BaseUsecase<List<Movie>,NoParameters>{
  final BaseMovieRepo baseMovieRepo;
  GetTopRatedMovieUsecase(this.baseMovieRepo);
  @override
  Future<Either<Failure,List<Movie>>>call (NoParameters parameters) async{
    return await baseMovieRepo.getTopRatedMovies();
  }
}