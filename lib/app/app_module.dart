import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex/app/modules/spacex/spacex_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:spacex/app/app_widget.dart';
import 'package:spacex/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  HttpLink link;
  ValueNotifier<GraphQLClient> client;

  AppModule() {
    WidgetsFlutterBinding.ensureInitialized();
    link = HttpLink(
      uri: 'https://api.spacex.land/graphql/',
    );
    client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );
  }

  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/spacex', module: HomeModule()),
        ModularRouter('/', module: SpacexModule()),
      ];

  @override
  Widget get bootstrap => AppWidget(
        client: client,
      );

  static Inject get to => Inject<AppModule>.of();
}
