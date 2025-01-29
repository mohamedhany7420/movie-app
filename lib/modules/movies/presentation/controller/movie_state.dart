part of 'movie_bloc.dart';

 class MovieState extends Equatable {

  final List<Movie> nowPlayingMovies;
  final RequestStates nowPlayingState;
  final String nowPlayingErrMessage;
  final List<Movie> popularMovies;
  final RequestStates popularState;
  final String popularErrMessage;
  final List<Movie> topRatedMovies;
  final RequestStates topRatedState;
  final String topRatedErrMessage;


  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestStates? nowPlayingState,
    String? nowPlayingErrMessage,
    List<Movie>? popularMovies,
    RequestStates? popularState,
    String? popularErrMessage,
    List<Movie>? topRatedMovies,
    RequestStates? topRatedState,
    String? topRatedErrMessage,
    }){
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingErrMessage: nowPlayingErrMessage ?? this.nowPlayingErrMessage,
      popularMovies: popularMovies ??this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularErrMessage: popularErrMessage?? this.popularErrMessage,
      topRatedMovies: topRatedMovies?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedErrMessage: topRatedErrMessage ?? this.popularErrMessage
    );
  }
  const MovieState({
      this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestStates.loading,
      this.nowPlayingErrMessage= '',
    this.popularMovies= const [],
    this.popularState= RequestStates.loading,
    this.popularErrMessage= '',
    this.topRatedMovies= const [],
    this.topRatedState= RequestStates.loading,
    this.topRatedErrMessage= '',
  });
  @override
  List<Object> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingErrMessage,
    popularMovies,
    popularState,
    popularErrMessage,
    topRatedMovies,
    topRatedState,
    topRatedErrMessage,
  ];
}
