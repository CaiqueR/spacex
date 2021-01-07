import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'upcoming_controller.g.dart';

@Injectable()
class UpcomingController = _UpcomingControllerBase with _$UpcomingController;

abstract class _UpcomingControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
