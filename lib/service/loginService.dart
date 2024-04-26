import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universe/component/utils/credentials.dart';
Future<dynamic> validateLogin() async {
  var reqBody = {
    "username": userCredentials.get_user(),
    "password": userCredentials.get_pass(),
    "type" : userCredentials.get_user_type()
  };
  print(reqBody);

  var response = await http.post(
    Uri.parse(userCredentials.IP+"/login"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decRes = jsonDecode(response.body);

  return decRes;
}