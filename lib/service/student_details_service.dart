import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:universe/component/model/credentials.dart';
import 'package:universe/component/model/student_details.dart';
import 'package:universe/component/model/student_details_report.dart';
Future<bool> addStudentDetails() async {
  var reqBody = {
    "value" : StudentDetailsReport.finalReport,
    "username" : userCredentials.get_user(),
    "type" : userCredentials.get_user_type()
  };
  print(reqBody);
  var response = await http.post(
    Uri.parse(userCredentials.IP+"/updateStudentDetail"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );

  var decodedResponse = jsonDecode(response.body);
  // Map<String,dynamic>  userDetails = Map<String,dynamic>.from(decodedResponse["userDetails"]);
  // Map<String,dynamic> codingDetails = {};
  // Map<String,dynamic> personalDetails = {};
  // List<dynamic> codingDetailsFromBackend = userDetails["codingDetails"];
  // for (int i=0;i<codingDetailsFromBackend.length;i++) {
  //   codingDetails[codingDetailsFromBackend[i]["platform"]] = [
  //     codingDetailsFromBackend[i]["contest"],
  //     codingDetailsFromBackend[i]["problemSolved"]
  //   ];
  // }
  // userDetails.forEach((key, value) {
  //   if (key != "codingDetails") {
  //     personalDetails[key] = value;
  //   }
  // });
  // StudentDetails.personalMap = personalDetails;
  // StudentDetails.codingMap = codingDetails;
  //
  // print("That separate PersonalDetail : $personalDetails");
  // print("That separate codingDetails :${StudentDetails.codingMap}");
  if (decodedResponse["status"] == true) {
    print("Added succesffully");
    return true;
  }
  else {
    print("Problem in adding a details");
    return false;
  }
}

Future<bool> getStudentDetails() async{
  print(StudentDetails.personalMap["rollNo"]);
  var reqBody = {
    "rollNo" : StudentDetails.personalMap["rollNo"]
  };
  print(reqBody);
  var response = await http.post(
    Uri.parse(userCredentials.IP+"/getStudentbyRollNo"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );
  var decodeResponse = jsonDecode(response.body);
  if (decodeResponse["status"]) {
    Map<String, dynamic> userDetails = Map<String, dynamic>.from(decodeResponse["userDetails"]);
    print("flag 3");
    Map<String, dynamic> codingDetails = {};
    Map<String, dynamic> personalDetails = {};
    print("Flag 1"try{
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
      StudentDetails.personalMap = {};
      StudentDetails.codingMap = {};
      StudentDetails.personalMap = personalDetails;
      StudentDetails.personalDetails = [];
      StudentDetails.codingDetails = [];
      StudentDetails.codingMap = codingDetails;
      StudentDetails.post = decodeResponse["post"];

      print("That separate PersonalDetail : ${StudentDetails.personalMap}");
      print("That separate codingDetails :${StudentDetails.codingMap}");
    }
    catch (e) {
      print("Error : $e");
    }
    return true;
  }
  return false;
}