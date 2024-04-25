import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universe/service/encryption.dart';
import 'package:universe/component/utils/credentials.dart';
Future<bool> validateLogin(String username, String password) async {
  var reqBody = {
    "rollno": username,
    "password": password,
  };
  print(reqBody);

  var response = await http.post(
    Uri.parse(userCredentials.IP+"/login"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decRes = jsonDecode(response.body);

  if (decRes['status']) {
    print(decRes['message']);
    return true;
  } else {
    print(decRes['message']);
    return false;
  }
}