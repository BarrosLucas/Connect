import 'dart:convert';

import 'package:connect/model/User.dart';
import 'package:connect/request/ApiConstants.dart';
import 'package:http/http.dart' as http;

class UserRequest{

  Future<User?> newUser(User user) async {
    print("URL: ${ApiConstants.userCreate}");
    print("Request: ${jsonEncode(user.toJson())}");

    final response = await http.post(
      Uri.parse(ApiConstants.userCreate),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "id":user.id,
        "name":user.name
      }),
    );

    if(response.statusCode == 201){
      print("New user success");
      print("Return: ${response.body}");
      return User.fromJson(json.decode(response.body));
    }
    print("New order fail - Request error: ${response.body}");
    print("New order fail - Request error: ${response.statusCode}");
    return null;
  }

  Future<User?> getUserByID(int id) async {
    final response = await http.get(
      Uri.parse(ApiConstants.userGetByID.replaceAll("{id}", "$id")),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Response Order: ${response.body}");
    print("Response code: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("Response Success: ${response.statusCode}");
      return User.fromJson(jsonDecode(response.body));
    }
    print("Response Order error: ${response.statusCode}");
    return null;
  }

  Future<bool> updateUser(User user) async {
    print("Request: ${jsonEncode(user.toJson())}");

    final response = await http.put(
      Uri.parse(ApiConstants.userUpdate),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "id":user.id,
        "name":user.name
      }),
    );

    if(response.statusCode == 200){
      print("New order success");
      return true;
    }
    print("New order fail - Request error: ${response.body}");
    print("New order fail - Request error: ${response.statusCode}");
    return false;
  }

  Future<bool> deleteUser(int id) async{
    final response = await http.delete(
      Uri.parse(ApiConstants.userDelete.replaceAll("{id}", "$id")),
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
}