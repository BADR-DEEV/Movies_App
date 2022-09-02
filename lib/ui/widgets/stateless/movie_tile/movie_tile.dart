import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/ui/widgets/stateless/movie_tile/movie_tile_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/movie/movie.dart';
import '../../../shared/ui_helper.dart';

/// A list tile for an article.
class MovieTile extends StatelessWidget {
  final Movie movie;
  final ValueChanged<Movie> onChanged;

  const MovieTile({required this.movie, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieTileViewModel>.nonReactive(
      viewModelBuilder: () => MovieTileViewModel(),
      onModelReady: (model) => model.init(movie),
      builder: (context, model, child) => InkWell(
        onTap: () async {
          var title = model.movie?.title != null ? model.movie?.title : "null";
          model.moveToMovieViewRoute(title ?? "", context);
          print(title);
          // print("did it worked");
        },
        child: Card(
          elevation: 2,
          margin: EdgeInsets.all(8),
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.r,
                    child: Image.network(
                      movie.thumb ??
                          'https://freepikpsd.com/file/2019/10/placeholder-image-png-5-Transparent-Images.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: [
                          UIHelper.verticalSpaceLarge(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  movie.title!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                              Text(
                                  ("${model.movie?.release_date != null ? movie.release_date!.substring(0, 4) : "Unknown"}")),
                            ],
                          ),
                          UIHelper.verticalSpaceSmall(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Thriler',
                                style: TextStyle(),
                              ),
                              UIHelper.horizontalSpaceLarge(),
                            ],
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text(
                                model.movie?.description ??
                                    "no specified description",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
