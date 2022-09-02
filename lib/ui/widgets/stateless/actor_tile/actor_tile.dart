import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/ui/widgets/stateless/actor_tile/actor_tile_view_model.dart';
import 'package:movieapp/ui/widgets/stateless/post_tile/post_tile_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/actor/actor.dart';
import '../../../../core/models/post/post.dart';
import '../../../shared/ui_helper.dart';
import '../../../views/actor_view/actor_view.dart';
import 'actor_tile_view_model.dart';
import 'actor_tile_view_model.dart';

/// A list tile for an article.
class ActorTile extends StatelessWidget {
  final Actor? actor;
  final ValueChanged<Actor> onChanged;

  const ActorTile({this.actor, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActorTileViewModel>.nonReactive(
      viewModelBuilder: () => ActorTileViewModel(),
      onModelReady: (model) => model.init(actor),
      builder: (context, model, child) => InkWell(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ActorView()),
          );
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
                      actor?.thumb ??
                          'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png',
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
                                  "${actor?.name!}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                            ],
                          ),
                          UIHelper.verticalSpaceSmall(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [],
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
