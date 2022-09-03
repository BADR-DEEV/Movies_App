import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:movieapp/generated/l10n.dart';
import 'package:stacked/stacked.dart';

import '/core/constant/end_point_parameters.dart';
import '../../../../locator.dart';
import '../../../core/repositories/movies_repository/movies_repository.dart';
import '../../widgets/stateless/indicators/empty_list_indicator.dart';
import '../../widgets/stateless/indicators/error_indicator.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '../../widgets/stateless/movie_tile/movie_tile.dart';
import 'movies_list_view_model.dart';

// ignore: must_be_immutable
class PagedMoviesListView extends StatefulWidget {
  final ValueChanged<Movie> onMoviesClicked;
  Map<String, dynamic> parameters;

  PagedMoviesListView(this.parameters, {required this.onMoviesClicked});

  @override
  _PagedMoviesItemsListViewViewState createState() =>
      _PagedMoviesItemsListViewViewState();
}

class _PagedMoviesItemsListViewViewState extends State<PagedMoviesListView> {
  _PagedMoviesItemsListViewViewState();

  final ScrollController? controller = ScrollController();

  final _pagingController = PagingController<int, Movie>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  @override
  void didUpdateWidget(PagedMoviesListView oldWidget) {
    // if (oldWidget.listPreferences != widget.listPreferences) {
    //   widget.pagingController.refresh();
    // }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var parameters = widget.parameters;

      parameters.putIfAbsent(EndPointParameter.PAGE, () => pageKey.toString());
      parameters[EndPointParameter.PAGE] = pageKey.toString();

      var items = await locator<MoviesRepository>().fetchMoviesList(parameters);

      if (items.isEmpty) {
        _pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoviesListViewModel>.reactive(
        viewModelBuilder: () => MoviesListViewModel(),
        builder: (context, model, child) => PagedListView.separated(
              physics: BouncingScrollPhysics(),
              scrollController: controller,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Movie>(
                itemBuilder: (context, movie, index) => MovieTile(
                  movie: movie,
                  onChanged: (value) {},
                ),
                firstPageProgressIndicatorBuilder: (context) =>
                    LoadingCircularProgressIndicator(),
                newPageProgressIndicatorBuilder: (context) =>
                    LoadingCircularProgressIndicator(),
                firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                  error: _pagingController.error,
                  onTryAgain: () => _pagingController.refresh(),
                ),
                noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(
                  title: '${AppLocalizations.of(context).empty_list}', //
                  message: '${AppLocalizations.of(context).empty_list}', //
                ),
              ),
              padding: const EdgeInsets.all(4),
              separatorBuilder: (context, index) => const SizedBox(
                height: 0,
              ),
            ));
  }
}
