import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universe/component/model/credentials.dart';
import 'package:universe/component/model/student_details.dart';
Future<dynamic> validateLogin() async {
  var reqBody = {
    "username": userCredentials.get_user(),
    "password": userCredentials.get_pass(),
    "type" : userCredentials.get_user_type(),
  };
  print(reqBody);

  var response = await http.post(
    Uri.parse(userCredentials.IP+"/login"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decRes = jsonDecode(response.body);
  Map<String,dynamic>  userDetails = Map<String,dynamic>.from(decRes["userDetails"]);
  Map<String,dynamic> codingDetails = {};
  Map<String,dynamic> personalDetails = {};
  List<dynamic> codingDetailsFromBackend = userDetails["codingDetails"];
  for (int i=0;i<codingDetailsFromBackend.length;i++) {
    codingDetails[codingDetailsFromBackend[i]["platform"]] = {
      codingDetailsFromBackend[i]["contest"],
      codingDetailsFromBackend[i]["problemSolved"]
    };
  }
  userDetails.forEach((key, value) {
    if (key != "codingDetails") {
      personalDetails[key] = value;
    }
  });
  StudentDetails.personalMap = personalDetails;
  StudentDetails.codingMap = codingDetails;

  print("That separate PersonalDetail : $personalDetails");
  print("That separate codingDetails :$codingDetails");

  return decRes;
}