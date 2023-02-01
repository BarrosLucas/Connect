import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'Device.g.dart';

@JsonSerializable()
class Device{
  int id;
  int idUser;
  String name;
  bool state;

  Device(this.id, this.idUser, this.name, this.state);

  factory Device.fromJson(Map<String,dynamic> data) => _$DeviceFromJson(data);

  Map<String,dynamic> toJson() => _$DeviceToJson(this);

  static List<Device> parseOrders(String responseBody) {
    final parsed = json.decode(responseBody);
    try{
      return parsed['devices'].map<Device>((json) => Device.fromJson(json)).toList();
    }catch(e){
      return List<Device>.of([Device.fromJson(parsed['devices'])]);
    }
  }
}