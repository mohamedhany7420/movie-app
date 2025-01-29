
import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/movies/domain/entities/movie_recommendations.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/movie_details.dart';

class MovieDetailsState extends Equatable {

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestStates.loading,
    this.movieDetailsErrMessage= '',
    this.recommendations =  const [],
    this.recommendationsState = RequestStates.loading,
    this.recommendationsErrMessage = ''
  });

  final MovieDetails? movieDetails;
  final RequestStates movieDetailsState;
  final String movieDetailsErrMessage;
  final List<MovieRecommendations> recommendations;
  final RequestStates recommendationsState;
  final String recommendationsErrMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestStates? movieDetailsState,
    String? movieDetailsErrMessage,
     List<MovieRecommendations>? recommendations,
     RequestStates? recommendationsState,
     String? recommendationsErrMessage
   }){
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsErrMessage: movieDetailsErrMessage ?? this.movieDetailsErrMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationsState: recommendationsState ?? this.recommendationsState,
      recommendationsErrMessage: recommendationsErrMessage ?? this.recommendationsErrMessage,
    );
  }
  @override
  List<Object?> get props => [
    movieDetails,
    movieDetailsState,
    movieDetailsErrMessage,
    recommendations,
    recommendationsState,
    recommendationsErrMessage
    ];
}
