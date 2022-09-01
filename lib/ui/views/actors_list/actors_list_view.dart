import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/ui_helper.dart';
import '/ui/widgets/stateless/app_bar.dart';
import 'actors_list_view_model.dart';

// ignore: must_be_immutable
class ActorsListView extends StatefulWidget {
  ActorsListView();

  @override
  _ActorsListViewState createState() => _ActorsListViewState();
}

class _ActorsListViewState extends State<ActorsListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(ActorsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActorsListViewModel>.reactive(
      viewModelBuilder: () => ActorsListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          //drawer: Drawer(child: CustomerDrawerMenu()),
          appBar: MyAppBar('Actors list'),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                hintText: 'Search'),
                            onChanged: (value) {},
                          ),
                        ),
                        flex: 1,
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: Iterable<int>.generate(20)
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
                  ),
                )
              ],
            ),
          )),
    );
  }
}
