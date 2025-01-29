import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/network/api_constants.dart';
import '../../../domain/entities/movie_recommendations.dart';

class CustomRecommendationItem extends StatelessWidget {
  const CustomRecommendationItem({
    super.key,
    required this.recommendation,
  });

  final MovieRecommendations recommendation;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: const Duration(milliseconds: 500),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: CachedNetworkImage(
          imageUrl: ApiConstants.imageUrl(recommendation.backdropPath??'https://abtc.ng/wp-content/uploads/2023/10/Palestine44.webp'),
          placeholder: (context, url) =>
              Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  height: 170.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: 180.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
