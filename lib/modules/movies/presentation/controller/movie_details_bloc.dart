import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies_app/modules/movies/domain/usecases/get_recommendations_use_case.dart';
import 'movie_details_state.dart';
part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;
  MovieDetailsBloc(
      this.getMovieDetailsUseCase,
      this.getRecommendationsUseCase
      ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
    on<GetMovieRecommendationsEvent>(getRecommendations);
  }

  Future<void> getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =  await getMovieDetailsUseCase(event.id);
    result.fold((failure) {
      emit(state.copyWith(
      movieDetailsState: RequestStates.failure,
      movieDetailsErrMessage: failure.errMessage
      ));
    }, (movieDetails){
      emit(state.copyWith(
        movieDetails: movieDetails,
        movieDetailsState: RequestStates.loaded
      ));
    });
  }
  Future<void> getRecommendations(GetMovieRecommendationsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =  await getRecommendationsUseCase(event.id);
    result.fold((failure) {
      emit(state.copyWith(
          recommendationsState: RequestStates.failure,
         recommendationsErrMessage: failure.errMessage
      ));
    }, (recommendations){
      emit(state.copyWith(
         recommendations: recommendations,
      recommendationsState: RequestStates.loaded
      ));
    });
  }

}
