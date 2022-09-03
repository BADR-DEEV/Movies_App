import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/ui/widgets/stateless/movie_tile/movie_tile_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/constant/asset_images.dart';
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
          //I know that this isnt efficient i will fix it later and get the data by id
          var title =
              model.movie?.title != null ? model.movie?.title : "Unknown";
          var description = model.movie?.description != null
              ? model.movie?.description
              : "Unknown";
          var release_date = model.movie?.release_date != null
              ? model.movie?.release_date
              : {"name": "Unknown"};

          var rating =
              model.movie?.rating != null ? model.movie?.rating : "Unknown";
          var rental_duration = model.movie?.rental_duration != null
              ? model.movie?.rental_duration
              : {"name": "Unknown"};
          var box_office = model.movie?.box_office != null
              ? model.movie?.box_office
              : "Unknown";

          var thumb = model.movie?.thumb != null
              ? model.movie?.thumb
              : Image.asset(
                  AssetImages.logo_png,
                );
          var running_time = model.movie?.running_time != null
              ? model.movie?.running_time
              : Image.asset(
                  AssetImages.logo_png,
                );

          model.moveToMovieViewRoute(
              title!,
              description!,
              release_date,
              rating!,
              rental_duration!,
              box_office!,
              thumb,
              running_time!,
              context);
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
