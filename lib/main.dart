import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:photo_app_challenge/src/constants/global_variables.dart';
import 'package:photo_app_challenge/src/features/address/presentation/provider/provider.dart';
import 'package:photo_app_challenge/src/features/address/presentation/screens/photo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PhotoChallengeApp());
}

class PhotoChallengeApp extends StatelessWidget {
  const PhotoChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PhotoProvider(PhotoProviderData(Dio())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Photo Gallery',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        // onGenerateRoute: (settings) => generateRoute(settings),
        home: const PhotoGalleryPage(),
      ),
    );
  }
}
