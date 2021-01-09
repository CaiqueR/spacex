import 'package:spacex/app/modules/spacex/details/details_module.dart';

import 'tabs/rockets/rockets_controller.dart';
import 'tabs/launches/launches_controller.dart';
import 'tabs/upcoming/upcoming_controller.dart';
import 'spacex_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'spacex_page.dart';

class SpacexModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RocketsController,
        $LaunchesController,
        $UpcomingController,
        $SpacexController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SpacexPage()),
        ModularRouter('/details', module: DetailsModule()),
      ];

  static Inject get to => Inject<SpacexModule>.of();
}
