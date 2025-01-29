import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_top_rated_movie_usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_now_playing_movie_usecase.dart';
part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUsecase getNowPlayingMoviesUsecase;
  final GetPopularMovieUsecase getPopularMoviesUseCase;
  final GetTopRatedMovieUsecase getTopRatedMoviesUseCase;
  MovieBloc(
      this.getNowPlayingMoviesUsecase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase
      ) : super(const MovieState()) {
    on<GetNowPlayingEvent>((event, emit)async {
    await _getNowPlayingMovies(emit);
    });
    on<GetPopularEvent>((event, emit)async {
      await _getPopularMovies(emit);
    });
    on<GetTopRatedEvent>((event, emit)async {
      await _getTopRatedMovies(emit);
    });
  }

  Future<void> _getNowPlayingMovies(Emitter<MovieState> emit) async {
    final result =  await getNowPlayingMoviesUsecase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
        nowPlayingErrMessage: failure.errMessage,
        nowPlayingState: RequestStates.failure
      ));
    }, (movies){
      emit(state.copyWith(
        nowPlayingMovies: movies,
        nowPlayingState: RequestStates.loaded
      ));
    });

  }

  Future<void> _getPopularMovies(Emitter<MovieState> emit) async {
    final result =  await getPopularMoviesUseCase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
          popularErrMessage: failure.errMessage,
          popularState: RequestStates.failure
      ));
    }, (movies){
      emit(state.copyWith(
          popularMovies: movies,
          popularState: RequestStates.loaded
      ));
    });
  }

  Future<void> _getTopRatedMovies(Emitter<MovieState> emit) async {
     final result =  await getTopRatedMoviesUseCase(const NoParameters());
    result.fold((failure) {
      emit(state.copyWith(
          topRatedErrMessage: failure.errMessage,
          topRatedState: RequestStates.failure
      ));
    }, (movies){
      emit(state.copyWith(
          topRatedMovies: movies,
          topRatedState: RequestStates.loaded
      ));
    });
  }
}
