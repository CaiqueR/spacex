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
  final _$valueAtom = Atom(name: '_SpacexControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_SpacexControllerBaseActionController =
      ActionController(name: '_SpacexControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SpacexControllerBaseActionController.startAction(
        name: '_SpacexControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SpacexControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
