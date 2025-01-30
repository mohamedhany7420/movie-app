import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/modules/movies/data/models/movie_model.dart';

import '../../../../../core/network/api_constants.dart';

class CustomSeeMoreItem extends StatelessWidget {
  const CustomSeeMoreItem({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child:  GestureDetector(
    onTap: () {
    GoRouter.of(context).push(
    '/movieDetails',
    extra: movieModel.id
    );
    },
    child:Container(
        decoration: BoxDecoration(
          color: const Color(0xff303030),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                    height: screenHeight * 0.2,
                    width: (screenHeight * 0.2) / 1.5,
                    imageUrl: ApiConstants.imageUrl(movieModel.backdropPath),
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Text(
                        error.toString(),
                        style: const TextStyle(fontSize: 4),
                      );
                    }
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                width: screenWidth * 0.5,
                child: Text(
                  movieModel.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
                  const SizedBox(height: 4.0),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.0,
                      horizontal: 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      movieModel.releaseDate.split('-')[0],
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 10.0,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    movieModel.voteAverage.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: Text(
                      movieModel.overview,
                    maxLines: 2,
                      overflow:TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 10
                      ),
                    ),
                  )
            ]
            ),
          ]),
        ),
      ),
    ),
    );
  }
}
