import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spacex/app/theme/theme.dart';

class AppWidget extends StatefulWidget {
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
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'SpaceX - Estatetial Challenge',
      theme: theme,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
