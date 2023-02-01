class ApiConstants {
  static String baseUrl = 'https://connect-iot.herokuapp.com/rest';

  static String userCreate = '${baseUrl}/user/create/';
  static String userGetByID = '${baseUrl}/user/{id}';
  static String userUpdate = '${baseUrl}/user/updateuser/';
  static String userDelete = '${baseUrl}/user/deleteuser/{id}';

  static String deviceCreate = '${baseUrl}/device/create/';
  static String deviceGetByID = '${baseUrl}/device/{id}';
  static String deviceUpdate = '${baseUrl}/device/updatedevice';
  static String deviceDelete = '${baseUrl}/device/deletedevice/{id}';
  static String deviceByUser = '${baseUrl}/device/getdevicesbyuser/{iduser}';
}