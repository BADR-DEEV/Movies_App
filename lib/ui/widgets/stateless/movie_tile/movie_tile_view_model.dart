import 'package:flutter/src/widgets/framework.dart';
import 'package:movieapp/core/models/genre/genre.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../router.gr.dart';

class MovieTileViewModel extends BaseViewModel {
  Movie? movie;
  Genre? genre;

  void init(Movie movie) {
    this.movie = movie;
  }

  Future<void> moveToMovieViewRoute(
      String title,
      String des,
      realease_date,
      String rating,
      rental_duration,
      String box_office,
      dynamic thumb,
      dynamic running_time,
      BuildContext context) async {
    await locator<NavigationService>().pushNamed(
        MovieViewRoute(
          title: title,
          description: des,
          releasedate: realease_date,
          rating: rating,
          rentalduration: rental_duration,
          boxoffice: box_office,
          thumb: thumb,
          runningtime: running_time,
        ),
        context);
  }
}
