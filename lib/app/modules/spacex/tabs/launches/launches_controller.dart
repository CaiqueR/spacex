import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'launches_controller.g.dart';

@Injectable()
class LaunchesController = _LaunchesControllerBase with _$LaunchesController;

abstract class _LaunchesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
