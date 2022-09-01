import 'dart:async';

import '/core/constant/api_routes.dart';
import '/core/services/http/http_service.dart';
import '/locator.dart';
import '../../models/movie/movie.dart';

abstract class MoviesRemoteDataSource {
  Future<Movie> fetchMovie([Map<String, dynamic>? parameters]);

  Future<List<Movie>> fetchMoviesList([Map<String, dynamic>? parameters]);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<Movie> fetchMovie([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .getHttp(ApiRoutes.post(parameters!['id']), parameters));

    return Movie.fromMap(restData['data']);
  }

  @override
  Future<List<Movie>> fetchMoviesList(
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.movies, parameters);

    var list = jsonData['data'] as List<dynamic>;

    var items = list.map<Movie>((vendorMap) => Movie.fromMap(vendorMap)).toList();

    return items;
  }
}
