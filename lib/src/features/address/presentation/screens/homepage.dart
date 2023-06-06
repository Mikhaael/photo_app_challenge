import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: const [Text('HomePage')],
          )),
    );
  }
}