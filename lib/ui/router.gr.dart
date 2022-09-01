// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../core/models/post/post.dart' as _i11;
import 'views/actors_list/actors_list_view.dart' as _i5;
import 'views/main/main_view.dart' as _i1;
import 'views/movie_view/movie_view.dart' as _i6;
import 'views/movies_list/movies_list_view.dart' as _i4;
import 'views/posts_list/posts_list_view.dart' as _i7;
import 'views/posts_view/posts_view.dart' as _i3;
import 'views/settings/settings_view.dart' as _i8;
import 'views/startup/start_up_view.dart' as _i2;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CustomerMainViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.CustomerMainView());
    },
    StartUpViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.StartUpView());
    },
    PostsViewRoute.name: (routeData) {
      final args = routeData.argsAs<PostsViewRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PostsView(args.post));
    },
    MoviesListViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.MoviesListView());
    },
    ActorsListViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.ActorsListView());
    },
    MovieViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.MovieView());
    },
    PostsListViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.PostsListView());
    },
    SettingsViewRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.SettingsView());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(CustomerMainViewRoute.name,
            path: '/customer-main-view'),
        _i9.RouteConfig(StartUpViewRoute.name, path: '/'),
        _i9.RouteConfig(PostsViewRoute.name, path: '/posts-view'),
        _i9.RouteConfig(MoviesListViewRoute.name, path: '/movies-list-view'),
        _i9.RouteConfig(ActorsListViewRoute.name, path: '/actors-list-view'),
        _i9.RouteConfig(MovieViewRoute.name, path: '/movie-view'),
        _i9.RouteConfig(PostsListViewRoute.name, path: '/posts-list-view'),
        _i9.RouteConfig(SettingsViewRoute.name, path: '/settings-view')
      ];
}

/// generated route for
/// [_i1.CustomerMainView]
class CustomerMainViewRoute extends _i9.PageRouteInfo<void> {
  const CustomerMainViewRoute()
      : super(CustomerMainViewRoute.name, path: '/customer-main-view');

  static const String name = 'CustomerMainViewRoute';
}

/// generated route for
/// [_i2.StartUpView]
class StartUpViewRoute extends _i9.PageRouteInfo<void> {
  const StartUpViewRoute() : super(StartUpViewRoute.name, path: '/');

  static const String name = 'StartUpViewRoute';
}

/// generated route for
/// [_i3.PostsView]
class PostsViewRoute extends _i9.PageRouteInfo<PostsViewRouteArgs> {
  PostsViewRoute({required _i11.Post post})
      : super(PostsViewRoute.name,
            path: '/posts-view', args: PostsViewRouteArgs(post: post));

  static const String name = 'PostsViewRoute';
}

class PostsViewRouteArgs {
  const PostsViewRouteArgs({required this.post});

  final _i11.Post post;

  @override
  String toString() {
    return 'PostsViewRouteArgs{post: $post}';
  }
}

/// generated route for
/// [_i4.MoviesListView]
class MoviesListViewRoute extends _i9.PageRouteInfo<void> {
  const MoviesListViewRoute()
      : super(MoviesListViewRoute.name, path: '/movies-list-view');

  static const String name = 'MoviesListViewRoute';
}

/// generated route for
/// [_i5.ActorsListView]
class ActorsListViewRoute extends _i9.PageRouteInfo<void> {
  const ActorsListViewRoute()
      : super(ActorsListViewRoute.name, path: '/actors-list-view');

  static const String name = 'ActorsListViewRoute';
}

/// generated route for
/// [_i6.MovieView]
class MovieViewRoute extends _i9.PageRouteInfo<void> {
  const MovieViewRoute() : super(MovieViewRoute.name, path: '/movie-view');

  static const String name = 'MovieViewRoute';
}

/// generated route for
/// [_i7.PostsListView]
class PostsListViewRoute extends _i9.PageRouteInfo<void> {
  const PostsListViewRoute()
      : super(PostsListViewRoute.name, path: '/posts-list-view');

  static const String name = 'PostsListViewRoute';
}

/// generated route for
/// [_i8.SettingsView]
class SettingsViewRoute extends _i9.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(SettingsViewRoute.name, path: '/settings-view');

  static const String name = 'SettingsViewRoute';
}
