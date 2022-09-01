import 'package:flutter/material.dart';
import 'package:movieapp/ui/views/movies_list/paged_movies_list_view.dart';
import 'package:stacked/stacked.dart';

import '/ui/widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'movies_list_view_model.dart';

// ignore: must_be_immutable
class MoviesListView extends StatefulWidget {
  MoviesListView();

  @override
  _MoviesListViewState createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(MoviesListView oldWidget) {
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
    return ViewModelBuilder<MoviesListViewModel>.reactive(
      viewModelBuilder: () => MoviesListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          //drawer: Drawer(child: CustomerDrawerMenu()),
          appBar: MyAppBar('Movies'),
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
                            Expanded(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: SizedBox(
                                    height: 58,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                      value: 'Two',
                                      iconEnabledColor: Colors.grey,
                                      onChanged: (String? value) {},
                                      items: <String>[
                                        'One',
                                        'Two',
                                        'Three',
                                        'Four'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: PagedMoviesListView({},
                              onMoviesClicked: (move) {}
                          ),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
