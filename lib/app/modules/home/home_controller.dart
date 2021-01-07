import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool showPass = false;

  @computed
  bool get isFilledMail => email.isNotEmpty;

  @computed
  bool get isFilledPass => password.isNotEmpty;

  @computed
  bool get isFilledMailAndPass => email.isNotEmpty && password.isNotEmpty;

  @action
  void setEmail(String newEmail) {
    email = newEmail;
  }

  @action
  void setPassword(String newPassword) {
    password = newPassword;
  }

  @action
  void setShowPass() {
    showPass = !showPass;
  }
}
