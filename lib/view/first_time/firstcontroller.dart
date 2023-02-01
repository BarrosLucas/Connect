import 'package:connect/model/User.dart';
import 'package:connect/request/users/UserRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'firstcontroller.g.dart';
class FirstController = ControllerBase with _$FirstController;

abstract class ControllerBase with Store{
  @observable
  TextEditingController userName = TextEditingController();

  @observable
  User? u = User(0,"");

  @action
  createNewUser() async{
    if(userName.text.isNotEmpty){
      u = await (UserRequest().newUser(User(0, userName.text)));
      if(u!=null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('iduser', u!.id);
        await prefs.setString('name', u!.name);
      }
    }
  }
}