import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/repositories/movies_repository/movies_repository.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/movie/movie.dart';
import '../../../core/services/navigation/navigation_service.dart';
import '../../../locator.dart';
import '../../router.gr.dart';

class MoviesListViewModel extends BaseViewModel {
  BuildContext? context;

  List<Movie> movies_list = [];

  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    movies_list = await locator<MoviesRepository>().fetchMoviesList({'paginate':'1000000'});

    setBusy(false);


  }


}
