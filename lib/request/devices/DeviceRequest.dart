import 'dart:convert';

import 'package:connect/model/Device.dart';
import 'package:connect/request/ApiConstants.dart';
import 'package:http/http.dart' as http;

class DeviceRequest{
  Future<Device?> newDevice(Device device) async {
    print("Request: ${jsonEncode(device.toJson())}");

    final response = await http.post(
      Uri.parse(ApiConstants.deviceCreate),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "id":device.id,
        "iduser":device.idUser,
        "name":device.name,
        "state":false
      }),
    );

    if(response.statusCode == 201){
      print("New user success");
      return Device.fromJson(json.decode(response.body));
    }
    print("New order fail - Request error: ${response.body}");
    print("New order fail - Request error: ${response.statusCode}");
    return null;
  }

  Future<Device?> getDeviceByID(int id) async {
    final response = await http.get(
      Uri.parse(ApiConstants.deviceGetByID.replaceAll("{id}", "$id")),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Response Order: ${response.body}");
    if (response.statusCode == 200) {
      print("Response Success: ${response.statusCode}");
      return Device.fromJson(json.decode(response.body));
    }
    print("Response Order error: ${response.statusCode}");
    return null;
  }

  Future<bool> deviceUpdate(Device device) async {
    print("Request: ${jsonEncode(device.toJson())}");

    final response = await http.put(
      Uri.parse(ApiConstants.deviceUpdate),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "id":device.id,
        "iduser":device.idUser,
        "name":device.name,
        "state":device.state
      }),
    );

    if(response.statusCode == 200){
      print("Updted success");
      return true;
    }
    print("New order fail - Request error: ${response.body}");
    print("New order fail - Request error: ${response.statusCode}");
    return false;
  }

  Future<bool> deleteUser(int id) async{
    final response = await http.delete(
      Uri.parse(ApiConstants.deviceDelete.replaceAll("{id}", "$id")),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if(response.statusCode == 200){
      print("New order success");
      return true;
    }
    print("New order fail - Request error: ${response.body}");
    print("New order fail - Request error: ${response.statusCode}");
    return false;
  }

  Future<List<Device>?> getDevicesByUser(int idUser) async{
    print("${ApiConstants.deviceByUser.replaceAll("{iduser}", "$idUser")}");

    final response = await http.get(
      Uri.parse(ApiConstants.deviceByUser.replaceAll("{iduser}", "$idUser")),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Response Order: ${response.body}");
    if (response.statusCode == 200) {
      print("Response Success: ${response.statusCode}");
      List<Device>? devices = [];
      try {
        devices = Device.parseOrders(response.body);
      }catch(e){
        print(e);
      }
      return devices;
    }
    print("Response Order error: ${response.statusCode}");
    return null;
  }
}