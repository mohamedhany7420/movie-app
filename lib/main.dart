import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'core/utils/service_locater.dart';
import 'modules/movies/presentation/controller/movie_bloc.dart';

void main() {
   ServicesLocator().init();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        lazy:  false,
        create: (context) => getIt<MovieBloc>()..add(GetNowPlayingEvent())..add(GetPopularEvent())..add(GetTopRatedEvent()),
    child : MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    )
    );
  }
}
