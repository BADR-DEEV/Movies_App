import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/actor/actor.dart';
import '../../../../core/models/post/post.dart';
import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../router.gr.dart';
import '../../../views/actor_view/actor_view.dart';

class ActorTileViewModel extends BaseViewModel {
  Actor? _actor;

  Actor? get actor => _actor;

  void init(Actor? actor) {
    _actor = actor;
  }
}
