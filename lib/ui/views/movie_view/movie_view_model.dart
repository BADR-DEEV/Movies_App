import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../core/repositories/movies_repository/movies_repository.dart';
import '../../../locator.dart';

class MovieViewModel extends BaseViewModel {
  BuildContext? context;
  Movie? movie;

  Future<void> da(BuildContext context, Movie movie) async {
    this.context = context;

    setBusy(true);

    this.movie = movie;

    setBusy(false);
  }

  // Future<void> GetMovie(String id) async {
  //   try {
  //     var returnedMovie =
  //         await locator<MoviesRepositoryImpl>().fetchMovie({"id": id});
  //     print("the data is ${returnedMovie}");
  //   } catch (error) {
  //     print("the error is ${error}");
  //   }

  //   // return returnedMovie;
  // }
}
