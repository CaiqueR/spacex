import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'spacex_controller.g.dart';

@Injectable()
class SpacexController = _SpacexControllerBase with _$SpacexController;

abstract class _SpacexControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
