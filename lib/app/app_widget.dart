import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex/app/theme/theme.dart';

import 'util/modified_scroll.dart';

class AppWidget extends StatefulWidget {
  final ValueNotifier<GraphQLClient> client;

  const AppWidget({Key key, this.client}) : super(key: key);
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  ThemeData theme;

  void setTheme() {
    var newTheme = MyTheme(context: context);
    theme = newTheme.current;
  }

  @override
  void initState() {
    super.initState();
    setTheme();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: widget.client,
      child: CacheProvider(
        child: MaterialApp(
          navigatorKey: Modular.navigatorKey,
          title: 'SpaceX - Estatetial Challenge',
          theme: theme,
          initialRoute: '/',
          onGenerateRoute: Modular.generateRoute,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            return ScrollConfiguration(
                behavior: ScrollBehaviorModified(), child: widget);
          },
        ),
      ),
    );
  }
}
