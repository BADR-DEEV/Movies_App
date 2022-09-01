import 'dart:async';

import 'package:logging/logging.dart';

import '../../data_sources/movies/movies_remote_data_source.dart';
import '../../models/movie/movie.dart';
import '/core/exceptions/cache_exception.dart';
import '/core/exceptions/network_exception.dart';
import '/core/exceptions/repository_exception.dart';
import '/core/services/connectivity/connectivity_service.dart';
import '/locator.dart';
import '../../data_sources/posts/post_remote_data_source.dart';
import '../../models/post/post.dart';

abstract class MoviesRepository {
  Future<Movie> fetchMovie([Map<String, dynamic>? parameters]);

  Future<List<Movie>> fetchMoviesList([Map<String, dynamic>? parameters]);
}

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource? remoteDataSource =
      locator<MoviesRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('MoviesRepositoryImpl');

  @override
  Future<Movie> fetchMovie([Map<String, dynamic>? parameters]) async {

    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchMovie(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }

  @override
  Future<List<Movie>> fetchMoviesList([Map<String, dynamic>? parameters]) async {
    try {

      final items = await remoteDataSource!.fetchMoviesList(parameters);

      return items;
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch posts remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch posts locally');
      throw RepositoryException(e.message);
    }
  }
}
