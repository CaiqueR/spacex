import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'spacex_controller.dart';

class SpacexPage extends StatefulWidget {
  final String title;
  const SpacexPage({Key key, this.title = "Spacex"}) : super(key: key);

  @override
  _SpacexPageState createState() => _SpacexPageState();
}

class _SpacexPageState extends ModularState<SpacexPage, SpacexController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
