import 'package:flutter/material.dart';
import 'package:movieapp/ui/views/actors_list/actors_list_view_model.dart';
import 'package:movieapp/ui/views/actors_list/paged_actors_list_view.dart';
import 'package:movieapp/ui/views/movies_list/paged_movies_list_view.dart';
import 'package:stacked/stacked.dart';

import '/ui/widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';

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
          appBar: MyAppBar('Actors'),
          body: model.isBusy
              ? LoadingCircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.search),
                                      hintStyle: TextStyle(fontSize: 14),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                          child: PagedActorsListView({},
                              onActorsClicked: (actor) {}),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
