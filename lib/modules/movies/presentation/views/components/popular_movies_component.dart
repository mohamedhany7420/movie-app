import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/network/api_constants.dart';
import '../../controller/movie_bloc.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>  previous.popularState != current.popularState,
      builder: (context, state) {
       if (state.popularState case RequestStates.failure) {
         return Center(
           child: Text(state.popularErrMessage),
         );
       }else{
         return
           Column(
             children: [
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
                         {
                           GoRouter.of(context).push(
                               '/popularView',
                               extra: state.popularMovies
                           );
                         }                    },
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
               FadeIn(
               duration: const Duration(milliseconds: 500),
               child: SizedBox(
                 height: 110.0,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                   itemCount: state.popularMovies.length,
                   itemBuilder: (context, index) {
                     final movie = state.popularMovies[index];
                     return Container(
                       padding: const EdgeInsets.only(right: 8.0),
                       child: InkWell(
                         onTap: () {
                             GoRouter.of(context).push(
                                 '/movieDetails',
                                 extra: movie.id
                             );
                         },
                         child: ClipRRect(
                           borderRadius:
                           const BorderRadius.all(Radius.circular(8.0)),
                           child: CachedNetworkImage(
                             width: 80.0,
                             fit: BoxFit.cover,
                             imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                             placeholder: (context, url) =>
                                 Shimmer.fromColors(
                                   baseColor: Colors.grey[850]!,
                                   highlightColor: Colors.grey[800]!,
                                   child: Container(
                                     height: 110.0,
                                     width: 80.0,
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
                       ),
                     );
                   },
                 ),
               ),
                        ),
             ],
           );
       }
      },
    )
    ;
  }
}
