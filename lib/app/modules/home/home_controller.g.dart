// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$isFilledMailComputed;

  @override
  bool get isFilledMail =>
      (_$isFilledMailComputed ??= Computed<bool>(() => super.isFilledMail,
              name: '_HomeControllerBase.isFilledMail'))
          .value;
  Computed<bool> _$isFilledPassComputed;

  @override
  bool get isFilledPass =>
      (_$isFilledPassComputed ??= Computed<bool>(() => super.isFilledPass,
              name: '_HomeControllerBase.isFilledPass'))
          .value;
  Computed<bool> _$isFilledMailAndPassComputed;

  @override
  bool get isFilledMailAndPass => (_$isFilledMailAndPassComputed ??=
          Computed<bool>(() => super.isFilledMailAndPass,
              name: '_HomeControllerBase.isFilledMailAndPass'))
      .value;

  final _$emailAtom = Atom(name: '_HomeControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_HomeControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$showPassAtom = Atom(name: '_HomeControllerBase.showPass');

  @override
  bool get showPass {
    _$showPassAtom.reportRead();
    return super.showPass;
  }

  @override
  set showPass(bool value) {
    _$showPassAtom.reportWrite(value, super.showPass, () {
      super.showPass = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setEmail(String newEmail) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setEmail');
    try {
      return super.setEmail(newEmail);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String newPassword) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPassword');
    try {
      return super.setPassword(newPassword);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowPass() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setShowPass');
    try {
      return super.setShowPass();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
showPass: ${showPass},
isFilledMail: ${isFilledMail},
isFilledPass: ${isFilledPass},
isFilledMailAndPass: ${isFilledMailAndPass}
    ''';
  }
}
