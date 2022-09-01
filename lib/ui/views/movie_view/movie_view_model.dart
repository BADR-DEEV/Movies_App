import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:stacked/stacked.dart';

class MovieViewModel extends BaseViewModel {
  BuildContext? context;
  Movie? movie;

  Future<void> init(BuildContext context, Movie movie) async {
    this.context = context;

    setBusy(true);

    this.movie = movie;

    setBusy(false);
  }
}
