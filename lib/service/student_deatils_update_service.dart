import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universe/component/utils/credentials.dart';
import 'package:universe/component/utils/student_details_report.dart';

Future<dynamic> updateDetails() async {
  var reqBody = {
    "username": userCredentials.get_user(),
    "type" : userCredentials.get_user_type(),
    "value" : {
      "coding" : StudentDetailsReport.codingMap,
      "personal" : StudentDetailsReport.personalMap
    },

  };
  print(reqBody);

  var response = await http.post(
    Uri.parse("${userCredentials.IP}/updateStudentDetail"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decRes = jsonDecode(response.body);

  return decRes;
}
