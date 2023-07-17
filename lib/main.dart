import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practise/providers/movie_provider.dart';
import 'package:provider_practise/view/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
      child: const MyApp(), create: (_) => MovieProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
