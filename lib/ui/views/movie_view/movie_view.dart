import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movieapp/ui/shared/ui_helper.dart';
import 'package:stacked/stacked.dart';

import '../actor_view/actor_view.dart';
import '/ui/shared/ui_helper.dart';
import '/ui/widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'movie_view_model.dart';

// ignore: must_be_immutable
class MovieView extends StatefulWidget {
  final String? title;
  final String? description;
  final String? release_date;
  final dynamic thumb;
  final running_time;
  final String? rating;
  final rental_duration;
  final String? box_office;

  const MovieView({
    Key? key,
    this.title,
    this.description,
    this.release_date,
    this.thumb,
    this.running_time,
    this.rating,
    this.rental_duration,
    this.box_office,
  }) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(MovieView oldWidget) {
    // if (oldWidget.listPreferences != widget.listPreferences) {
    //   _pagingController.refresh();
    // }
    super.didUpdateWidget(oldWidget);
  }

  TextEditingController? commentController;
  FocusNode? commentFocusNode;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();

    commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    commentController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieViewModel>.reactive(
      viewModelBuilder: () => MovieViewModel(),
      onModelReady: (model) async {
        // print(widget.title);
        // print(widget.description);
        // print(widget.box_office);
        // print(widget.release_date);
        // print(widget.rating);
        // print(widget.thumb);
        // print(widget.running_time.minutes);
        // print(widget.rental_duration.days);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(
              //  drawer: Drawer(child: CustomerDrawerMenu()),
              appBar: MyAppBar(),
              body: LoadingCircularProgressIndicator())
          : Scaffold(
              appBar: MyAppBar("Movie Info"),
              body: model.isBusy
                  ? LoadingCircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(4),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: Card(
                                elevation: 2,
                                margin: EdgeInsets.all(8),
                                child: Container(
                                  // height:
                                  // MediaQuery.of(context).size.height / 5,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          //color: Colors.r,
                                          child: Image.network(
                                              '${widget.thumb}',
                                              fit: BoxFit.cover,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25, right: 25),
                                            child: Column(
                                              children: [
                                                UIHelper.verticalSpaceLarge(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        // '${widget.title}',
                                                        "${widget.title}",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // UIHelper.verticalSpaceSmall(),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    UIHelper
                                                        .verticalSpaceMedium(),
                                                    Text.rich(TextSpan(
                                                        style:
                                                            TextStyle(), //apply style to all
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  'Running Time : ',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),

                                                          TextSpan(
                                                              text:
                                                                  '0${widget.running_time.hours}:${widget.running_time.minutes}:00'),
                                                          // style:
                                                          // TextStyle())
                                                        ])),
                                                    UIHelper
                                                        .verticalSpaceMedium(),
                                                    ReusableWidget(
                                                      title: "Release Date ",
                                                      titleData: widget
                                                          .release_date
                                                          ?.substring(0, 4),
                                                    ),
                                                    UIHelper
                                                        .verticalSpaceMedium(),
                                                    ReusableWidget(
                                                      title: "Box office",
                                                      titleData:
                                                          widget.box_office,
                                                    ),
                                                    UIHelper
                                                        .verticalSpaceMedium(),
                                                    ReusableWidget(
                                                      title: "Rental duration",
                                                      titleData: widget
                                                          .rental_duration.days,
                                                    ),
                                                    UIHelper
                                                        .verticalSpaceMedium(),
                                                    ReusableWidget(
                                                      title: "Rating",
                                                      titleData: widget.rating,
                                                    ),
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
                            Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      "Description\n\n" + widget.description!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  color: Colors.white,
                                  width: double.infinity,
                                  // height: 250,
                                ),
                              ),
                            ),
                            Container(
                              height: 160,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: Iterable<int>.generate(20)
                                    .map((e) => InkWell(
                                          onTap: () async {},
                                          child: Card(
                                            elevation: 2,
                                            margin: EdgeInsets.all(8),
                                            child: Container(
                                              width: 110,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 7,
                                                    child: Container(
                                                      //color: Colors.r,
                                                      child: Image.network(
                                                        'https://picsum.photos/250?image=' +
                                                            '${Random().nextInt(50)}',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                right: 8),
                                                        child: Column(
                                                          children: [
                                                            UIHelper
                                                                .verticalSpaceSmall(),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    'The Godfather',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Thriler',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                UIHelper
                                                                    .horizontalSpaceSmall(),
                                                              ],
                                                            ),
                                                            UIHelper
                                                                .horizontalSpaceLarge(),
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        )) // TODO move this section to staeLess widgets
                                    .toList(),
                              ),
                            ),
                            Container(
                              height: 350,
                              child: ListView(
                                children: Iterable<int>.generate(5)
                                    .map((e) => InkWell(
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ActorView()),
                                            );
                                          },
                                          child: Card(
                                            elevation: 2,
                                            margin: EdgeInsets.all(8),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      //color: Colors.r,
                                                      child: Image.network(
                                                        'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 25,
                                                                right: 25),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'The Godfather',
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          // TODO Create a reusable widget
                                        )) // TODO move this section to staeLess widgets
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
    );
  }
} //i should create a reusable widget

class ReusableWidget extends StatelessWidget {
  final title;
  final titleData;
  const ReusableWidget({Key? key, this.title, this.titleData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(style: TextStyle(), //apply style to all
        children: [
          TextSpan(
              text: '${title} : ',
              style: TextStyle(fontWeight: FontWeight.bold)),

          TextSpan(text: '${titleData}'),
          // style:
          // TextStyle())
        ]));
  }
}
