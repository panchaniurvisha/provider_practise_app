import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider_practise/model/movie_model.dart';

final List<MovieModel> initialData = List.generate(
    50,
    (index) => MovieModel(
        title: "Movie $index",
        duration: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {
  final List<MovieModel> movies = initialData;
  List<MovieModel> get getMovies => movies;

  final List<MovieModel> myList = [];
  List<MovieModel> get getMyList => myList;

  void addToList(MovieModel movieModel) {
    myList.add(movieModel);
    notifyListeners();
  }

  void removeFromList(MovieModel movieModel) {
    myList.remove(movieModel);
    notifyListeners();
  }
}
