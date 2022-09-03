import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movieapp/ui/shared/ui_helper.dart';
import 'package:stacked/stacked.dart';

import '/ui/shared/ui_helper.dart';
import '/ui/widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'actor_view_model.dart';

// ignore: must_be_immutable
class ActorView extends StatefulWidget {
  ActorView();

  @override
  _ActorViewState createState() => _ActorViewState();
}

class _ActorViewState extends State<ActorView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(ActorView oldWidget) {
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
    return ViewModelBuilder<ActorViewModel>.reactive(
      viewModelBuilder: () => ActorViewModel(),
      onModelReady: (model) async {
        //await model.init(context, widget.Actor!);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(
              //  drawer: Drawer(child: CustomerDrawerMenu()),
              appBar: MyAppBar(),
              body: LoadingCircularProgressIndicator())
          : Scaffold(
              appBar: MyAppBar("Actor details"),
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
                                height: MediaQuery.of(context).size.height / 4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // UIHelper.verticalSpaceLarge(),
                                              Row(
                                                // mainAxisAlignment:
                                                //   MainAxisAlignment.center,
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
                              height: MediaQuery.of(context).size.height,
                              child: Expanded(
                                child: GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 12,
                                          mainAxisSpacing: 12),
                                  scrollDirection: Axis.vertical,
                                  children: Iterable<int>.generate(20)
                                      .map((e) => InkWell(
                                            onTap: () async {},
                                            child: Expanded(
                                              child: Card(
                                                elevation: 2,
                                                margin: EdgeInsets.all(4),
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  // width: 250,
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          flex: 8,
                                                          child: Container(
                                                            // color: Colors.red,
                                                            child:
                                                                Image.network(
                                                              'https://picsum.photos/250?image=' +
                                                                  '${Random().nextInt(50)}',
                                                              fit: BoxFit.cover,
                                                              width: double
                                                                  .infinity,
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
                                                                        child:
                                                                            Text(
                                                                          'The Godfather',
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      UIHelper
                                                                          .horizontalSpaceSmall(),
                                                                      Text(
                                                                          '(2022)',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                          )),
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
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                        ),
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
                                              ),
                                            ),
                                          )) // TODO move this section to staeLess widgets
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
    );
  }
}
