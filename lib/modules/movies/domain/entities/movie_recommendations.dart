import 'package:equatable/equatable.dart';

class MovieRecommendations extends Equatable {
  final int id;
  final String? backdropPath;

  const MovieRecommendations({required this.id, required this.backdropPath});

  @override
  List<Object?> get props => [id,backdropPath];
}