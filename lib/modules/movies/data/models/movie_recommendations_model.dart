
import '../../domain/entities/movie_recommendations.dart';

class MovieRecommendationsModel extends MovieRecommendations{
  const MovieRecommendationsModel({
    required super.backdropPath,
    required super.id,
  });
  factory MovieRecommendationsModel.fromJson(Map<String,dynamic> json) =>MovieRecommendationsModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
  );
}