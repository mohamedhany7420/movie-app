import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/network/api_constants.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.transparent,
            ],
            stops: [0.0, 0.5, 1.0, 1.0],
          ).createShader(
            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
          );
        },
        blendMode: BlendMode.dstIn,
        child: CachedNetworkImage(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery.of(context).size.height * 0.25,
          imageUrl: ApiConstants.imageUrl(image),
          fit: BoxFit.cover,
          placeholder:  (context, url) =>
              Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        ),
      ),
    );
  }
}
