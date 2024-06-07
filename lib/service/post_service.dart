import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universe/component/utils/credentials.dart';
Future<bool> addPost(TextEditingController title,TextEditingController content) async {
  var reqBody = {
    "username": userCredentials.get_user(),
    "title" : title.text.toString(),
    "content" : content.text.toString(),
    "filter" : [],
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