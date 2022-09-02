import 'package:stacked/stacked.dart';

import '../../../../core/models/actor/actor.dart';
import '../../../../core/models/post/post.dart';

class ActorTileViewModel extends BaseViewModel {
  Actor? _actor;

  Actor? get actor => _actor;

  void init(Actor? actor) {
    _actor = actor;
  }
}
