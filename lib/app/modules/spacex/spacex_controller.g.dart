// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spacex_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SpacexController = BindInject(
  (i) => SpacexController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SpacexController on _SpacexControllerBase, Store {
  final _$currentTabPageAtom =
      Atom(name: '_SpacexControllerBase.currentTabPage');

  @override
  int get currentTabPage {
    _$currentTabPageAtom.reportRead();
    return super.currentTabPage;
  }

  @override
  set currentTabPage(int value) {
    _$currentTabPageAtom.reportWrite(value, super.currentTabPage, () {
      super.currentTabPage = value;
    });
  }

  final _$_SpacexControllerBaseActionController =
      ActionController(name: '_SpacexControllerBase');

  @override
  void changeCurrentPage(int newPage) {
    final _$actionInfo = _$_SpacexControllerBaseActionController.startAction(
        name: '_SpacexControllerBase.changeCurrentPage');
    try {
      return super.changeCurrentPage(newPage);
    } finally {
      _$_SpacexControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTabPage: ${currentTabPage}
    ''';
  }
}
