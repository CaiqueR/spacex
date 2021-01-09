import 'details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'details_page.dart';

class DetailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DetailsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) {
          return DetailsPage(
            launch: args.data.elementAt(0),
            imageNumber: args.data.elementAt(1),
          );
        }),
      ];

  static Inject get to => Inject<DetailsModule>.of();
}
