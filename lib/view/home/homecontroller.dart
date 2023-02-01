import 'package:connect/model/Device.dart';
import 'package:connect/model/User.dart';
import 'package:connect/request/devices/DeviceRequest.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'homecontroller.g.dart';
class HomeController = ControllerBase with _$HomeController;

abstract class ControllerBase with Store{
  @observable
  TextEditingController newDevice = TextEditingController();

  @observable
  User user = User(0,"Usuário");

  @observable
  ObservableList<Device> devices = ObservableList.of([]);

  @observable
  ObservableList<bool> states = ObservableList.of([]);

  @observable
  bool isLoading = false;

  @observable
  bool isCreatingNewDevice = false;

  @action
  setCreateNewDevice(bool isCreatingNewDevice){
    this.isCreatingNewDevice = isCreatingNewDevice;
  }

  @action
  setLoadingDevice(){
    isLoading = true;

    (DeviceRequest().getDevicesByUser(user.id).then((value) {
      if(value != null){
        value!.forEach((element) {
          print(element.toJson());
          devices.add(element);
          states.add(element.state);
        });
      }else{
        devices = ObservableList.of([]);
        states = ObservableList.of([]);
      }
    }));

    isLoading = false;
  }

  @action
  setUser(User u){
    user = u;
  }

  @action
  createNewDevice(){
    if(newDevice.text.isNotEmpty){
      (DeviceRequest().newDevice(Device(0,user.id,newDevice.text, false))).then((value){
        if(value!=null){
          devices.add(value!);
          states.add(value.state);
        }
      });
      setCreateNewDevice(false);
    }
  }

  @action
  updateState(bool newState, int index){
    Device nDevice = devices[index];
    nDevice.state = newState;
    (DeviceRequest().deviceUpdate(nDevice)).then((value) {
      states[index] = newState;
      devices[index].state = newState;
    });
  }

  @action
  clear(){
    newDevice = TextEditingController();

    devices = ObservableList.of([]);

    isLoading = false;

    isCreatingNewDevice = false;
  }

}
