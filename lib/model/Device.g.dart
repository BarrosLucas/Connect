// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      int.parse(json['id'] as String),
      int.parse(json['iduser'] as String),
      json['name'] as String,
      ((json['state'] as String) == "true"),
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'iduser': instance.idUser,
      'name': instance.name,
      'state': instance.state,
    };
