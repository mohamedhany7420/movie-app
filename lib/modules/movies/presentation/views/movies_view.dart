import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/modules/movies/presentation/views/components/now_playing_component.dart';
import 'package:movies_app/modules/movies/presentation/views/components/popular_movies_component.dart';
import 'package:movies_app/modules/movies/presentation/views/components/top_rated_movies_component.dart';


class MovieView extends StatelessWidget {
  const MovieView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO POPULAR SCREEN
                    },
                    child: const Row(
                      children: [
                        Text('See More'),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const PopularMoviesComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO Top Rated Movies Screen
                    },
                    child: const Row(
                      children: [
                        Text('See More'),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const TopRatedMoviesComponent(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
