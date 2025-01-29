part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}
class GetNowPlayingEvent extends MovieEvent{}
class GetPopularEvent extends MovieEvent{}
class GetTopRatedEvent extends MovieEvent{}

