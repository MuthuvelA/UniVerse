import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universe/component/model/credentials.dart';
import 'package:universe/component/model/reportList.dart';

Future<dynamic> generate() async {
  var reqBody = {
    "username": userCredentials.get_user(),
    "coding" : ReportList.coding,
    "personal" : ReportList.personalList
  };
  print(reqBody);

  var response = await http.post(
    Uri.parse("${userCredentials.IP}/generateExcel"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decRes = jsonDecode(response.body);

  return decRes;
}