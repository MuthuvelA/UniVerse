import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universe/component/utils/credentials.dart';
Future<bool> usernameValidation(TextEditingController username, String domain) async {
  var reqBody = {
    "username": username.text.trim(),
  };
  print(reqBody);

  var response = await http.post(
    Uri.parse("${userCredentials.IP}/validate$domain"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decRes = jsonDecode(response.body);

  return decRes['status'];
}