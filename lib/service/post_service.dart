import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universe/component/utils/credentials.dart';
Future<bool> addPost(String title,TextEditingController link,TextEditingController content) async {
  var reqBody = {
    "username": userCredentials.get_user(),
    "title" : title,
    "content" : content.text.toString(),
    "link" : link.text.trim()
  };
  print(reqBody);

  var response = await http.post(
    Uri.parse("${userCredentials.IP}/addPost"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decRes = jsonDecode(response.body);

  return decRes['status'];
}