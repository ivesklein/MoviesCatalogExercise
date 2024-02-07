import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'package:movies/views/dashboard/dashboard_view.dart';
import 'package:movies/views/details/details_view.dart';
import 'package:movies/views/splash/splash_view.dart';
import 'package:movies/views/watchlist/watchlist_view.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Exercise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorHL),
        useMaterial3: true,
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (_) => const Dashboard(),
        //'/dashboard': (_) => const TodoList(),
        '/watchlist': (_) => const Watchlist(),
        '/details': (_) => const Details(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}