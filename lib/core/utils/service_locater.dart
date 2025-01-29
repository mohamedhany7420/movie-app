import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/modules/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/modules/movies/data/repos/movie_repo.dart';
import 'package:movies_app/modules/movies/domain/repos/base_movie_repo.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_recommendations_use_case.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movies_app/modules/movies/presentation/controller/movie_bloc.dart';
import 'package:movies_app/modules/movies/presentation/controller/movie_details_bloc.dart';

import '../network/api_service.dart';


final getIt = GetIt.instance;


class ServicesLocator {
  void init() {
    /// Bloc
    getIt.registerFactory(() => MovieBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt(), getIt()));

    /// Use Cases
    getIt.registerLazySingleton(() => GetNowPlayingMovieUsecase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMovieUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMovieUsecase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationsUseCase(getIt()));

    /// Repository
    getIt.registerLazySingleton<BaseMovieRepo>(
            () => MovieRepo(getIt()));

    /// DATA SOURCE
    getIt.registerLazySingleton<BaseMovieRemoteDatasource>(
            () => MovieRemoteDataSource(getIt()));
    /// api
    getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()),);

  }
}