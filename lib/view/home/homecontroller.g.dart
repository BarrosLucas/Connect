// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homecontroller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on ControllerBase, Store {
  late final _$newDeviceAtom =
      Atom(name: 'ControllerBase.newDevice', context: context);

  @override
  TextEditingController get newDevice {
    _$newDeviceAtom.reportRead();
    return super.newDevice;
  }

  @override
  set newDevice(TextEditingController value) {
    _$newDeviceAtom.reportWrite(value, super.newDevice, () {
      super.newDevice = value;
    });
  }

  late final _$userAtom = Atom(name: 'ControllerBase.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$devicesAtom =
      Atom(name: 'ControllerBase.devices', context: context);

  @override
  ObservableList<Device> get devices {
    _$devicesAtom.reportRead();
    return super.devices;
  }

  @override
  set devices(ObservableList<Device> value) {
    _$devicesAtom.reportWrite(value, super.devices, () {
      super.devices = value;
    });
  }

  late final _$statesAtom =
      Atom(name: 'ControllerBase.states', context: context);

  @override
  ObservableList<bool> get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(ObservableList<bool> value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'ControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isCreatingNewDeviceAtom =
      Atom(name: 'ControllerBase.isCreatingNewDevice', context: context);

  @override
  bool get isCreatingNewDevice {
    _$isCreatingNewDeviceAtom.reportRead();
    return super.isCreatingNewDevice;
  }

  @override
  set isCreatingNewDevice(bool value) {
    _$isCreatingNewDeviceAtom.reportWrite(value, super.isCreatingNewDevice, () {
      super.isCreatingNewDevice = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic setCreateNewDevice(bool isCreatingNewDevice) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setCreateNewDevice');
    try {
      return super.setCreateNewDevice(isCreatingNewDevice);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoadingDevice() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setLoadingDevice');
    try {
      return super.setLoadingDevice();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUser(User u) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setUser');
    try {
      return super.setUser(u);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic createNewDevice() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.createNewDevice');
    try {
      return super.createNewDevice();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateState(bool newState, int index) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.updateState');
    try {
      return super.updateState(newState, index);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newDevice: ${newDevice},
user: ${user},
devices: ${devices},
states: ${states},
isLoading: ${isLoading},
isCreatingNewDevice: ${isCreatingNewDevice}
    ''';
  }
}
