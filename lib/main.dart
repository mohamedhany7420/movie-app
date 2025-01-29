import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'core/utils/service_locater.dart';

void main() {
   ServicesLocator().init();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black12),
    );
  }
}
