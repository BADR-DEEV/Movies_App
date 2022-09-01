import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movieapp/ui/shared/ui_helper.dart';
import 'package:stacked/stacked.dart';

import '/ui/shared/ui_helper.dart';
import '/ui/widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'movie_view_model.dart';

// ignore: must_be_immutable
class MovieView extends StatefulWidget {
  MovieView();

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
        //await model.init(context, widget.movie!);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(
              //  drawer: Drawer(child: CustomerDrawerMenu()),
              appBar: MyAppBar(),
              body: LoadingCircularProgressIndicator())
          : Scaffold(
              appBar: MyAppBar("title"),
              body: model.isBusy
                  ? LoadingCircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              elevation: 2,
                              margin: EdgeInsets.all(8),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        //color: Colors.r,
                                        child: Image.network(
                                          'https://picsum.photos/250?image=9',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 25),
                                          child: Column(
                                            children: [
                                              UIHelper.verticalSpaceLarge(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'The Godfather',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text('(2022)'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Thriler',
                                                    style: TextStyle(),
                                                  ),
                                                  UIHelper
                                                      .horizontalSpaceSmall(),
                                                ],
                                              ),
                                              UIHelper.horizontalSpaceLarge(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    'The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.',
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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

                            Container(
                              height: 160,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: Iterable<int>.generate(20)
                                    .map((e) => InkWell(
                                  onTap: () async {



                                  },
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
                                                'https://picsum.photos/250?image='+'${Random().nextInt(50)}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Column(
                                                  children: [
                                                    UIHelper.verticalSpaceSmall(),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'The Godfather',
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Thriler',
                                                          style: TextStyle(),
                                                        ),
                                                        UIHelper
                                                            .horizontalSpaceSmall(),
                                                      ],
                                                    ),
                                                    UIHelper.horizontalSpaceLarge(),
                                                  
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


                                  },
                                  child: Card(
                                    elevation: 2,
                                    margin: EdgeInsets.all(8),
                                    child: Container(
                                      height:
                                      MediaQuery.of(context).size.height / 10,
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
                                                padding: const EdgeInsets.only(
                                                    left: 25, right: 25),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'The Godfather',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
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
}
