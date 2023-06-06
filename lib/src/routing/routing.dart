import 'package:flutter/material.dart';
import 'package:photo_app_challenge/src/features/address/presentation/screens/photo_details.dart';
import 'package:photo_app_challenge/src/features/address/presentation/screens/photo_screen.dart';

import '../features/address/presentation/screens/homepage.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );
    // case PhotoGalleryPage.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => PhotoGalleryPage(),
    //   );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
            body: Center(
              child: Text('Screen does not exits'),
            )),
      );
  }
}