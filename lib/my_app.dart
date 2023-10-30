import 'package:cocktail_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of the application.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(100, 126, 90, 203),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
