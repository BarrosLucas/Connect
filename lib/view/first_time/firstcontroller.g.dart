// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firstcontroller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FirstController on ControllerBase, Store {
  late final _$userNameAtom =
      Atom(name: 'ControllerBase.userName', context: context);

  @override
  TextEditingController get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(TextEditingController value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$uAtom = Atom(name: 'ControllerBase.u', context: context);

  @override
  User? get u {
    _$uAtom.reportRead();
    return super.u;
  }

  @override
  set u(User? value) {
    _$uAtom.reportWrite(value, super.u, () {
      super.u = value;
    });
  }

  late final _$createNewUserAsyncAction =
      AsyncAction('ControllerBase.createNewUser', context: context);

  @override
  Future createNewUser() {
    return _$createNewUserAsyncAction.run(() => super.createNewUser());
  }

  @override
  String toString() {
    return '''
userName: ${userName},
u: ${u}
    ''';
  }
}
