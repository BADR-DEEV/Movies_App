import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/repositories/movies_repository/movies_repository.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/actor/actor.dart';
import '../../../core/models/movie/movie.dart';
import '../../../core/repositories/actors_repository/actors_repository.dart';
import '../../../core/services/navigation/navigation_service.dart';
import '../../../locator.dart';
import '../../router.gr.dart';

class ActorsListViewModel extends BaseViewModel {
  BuildContext? context;

  List<Actor> actors_list = [];

  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    actors_list =
        await locator<ActorsRepository>().fetchActorsList({'paginate': '500'});

    setBusy(false);
  }
}
