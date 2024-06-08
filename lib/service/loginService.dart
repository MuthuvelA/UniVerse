import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universe/component/utils/credentials.dart';
import 'package:universe/component/utils/staff_details.dart';
import 'package:universe/component/utils/student_details.dart';
Future<dynamic> validateLogin() async {
  var reqBody = {
    "username": userCredentials.get_user(),
    "password": userCredentials.get_pass(),
    "type" : userCredentials.get_user_type(),
  };
  print(reqBody);

  var response = await http.post(
    Uri.parse("${userCredentials.IP}/login"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );
  print("Flag 2");

  var decRes = jsonDecode(response.body);
  print("Flag 2");
  try {
    if (decRes["status"]){
      Map<String, dynamic> userDetails = Map<String, dynamic>.from(decRes["userDetails"]);
      print("flag 3");
      Map<String, dynamic> codingDetails = {};
      Map<String, dynamic> personalDetails = {};
      print("Flag 1");
      List<dynamic> codingDetailsFromBackend = userDetails["codingDetails"];
      for (int i = 0; i < codingDetailsFromBackend.length; i++) {
        codingDetails[codingDetailsFromBackend[i]["platform"]] = [
          codingDetailsFromBackend[i]["contest"],
          codingDetailsFromBackend[i]["problemSolved"]
        ];
      }
      userDetails.forEach((key, value) {
        if (key != "codingDetails") {
          personalDetails[key] = value;
        }
      });
      // StudentDetails.codingDetails[0] = userDetails["leetcode"];
      // StudentDetails.codingDetails[1] = userDetails["codechef"];
      StudentDetails.personalMap = personalDetails;
      StudentDetails.codingMap = codingDetails;
      if (userCredentials.get_user_type() == "Student") {
        StudentDetails.post = decRes["post"];
        StudentDetails.notificationDetails = personalDetails["invalidUserName"];
        print("From Login service : ${StudentDetails.notificationDetails}");
      }

      print("That separate PersonalDetail : ${StudentDetails.personalMap}");
      print("That separate codingDetails :${StudentDetails.codingMap}");
      return decRes;
    }
  }
  catch(e) {
    print("Error : $e");
  }

  return decRes;
}
Future<bool> staffLogin() async {
  var reqBody = {
    "username": userCredentials.get_user(),
    "password": userCredentials.get_pass(),
    "type" : userCredentials.get_user_type(),
  };
  print(reqBody);

  var response = await http.post(
    Uri.parse("${userCredentials.IP}/login"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );
  var decodeResponse = jsonDecode(response.body);
  List<dynamic> userDetails = List<dynamic>.from(decodeResponse["students"]);

  if (decodeResponse["status"]) {
    StaffDetails.allAboutStudent = userDetails;
    StaffDetails.intern = List<dynamic>.from(decodeResponse["intern"]);
    StaffDetails.placed = List<dynamic>.from(decodeResponse["placed"]);
    StaffDetails.nonPlaced = List<dynamic>.from(decodeResponse["nonPlaced"]);
    print("From staff login ${StaffDetails.allAboutStudent}");
    return true;
  }
  return false;
}