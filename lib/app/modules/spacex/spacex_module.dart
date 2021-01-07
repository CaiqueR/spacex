import 'spacex_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'spacex_page.dart';

class SpacexModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SpacexController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SpacexPage()),
      ];

  static Inject get to => Inject<SpacexModule>.of();
}
