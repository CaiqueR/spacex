import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'rockets_controller.g.dart';

@Injectable()
class RocketsController = _RocketsControllerBase with _$RocketsController;

abstract class _RocketsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
