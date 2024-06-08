import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universe/component/utils/credentials.dart';
import 'package:universe/component/utils/student_details.dart';
import 'package:universe/component/utils/student_details_report.dart';
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
  var decRes = jsonDecode(response.body);
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
    StudentDetails.personalDetails = [];
    StudentDetails.codingDetails = [];
    StudentDetails.personalMap = {};
    StudentDetails.codingMap = {};
    StudentDetails.notificationDetails = [];
    StudentDetails.personalMap = personalDetails;
    StudentDetails.codingMap = codingDetails;
    StudentDetails.notificationDetails = personalDetails["invalidUserName"];
    print("From Updation service : ${StudentDetails.notificationDetails}");

    print("That separate PersonalDetail : ${StudentDetails.personalMap}");
    print("That separate codingDetails :${StudentDetails.codingMap}");
    return true;
  }
  return false;
}

Future<bool> getLeaderboard() async{
  StudentDetails.leetcodeLeaderboard = [];
    StudentDetails.codeforcesLeaderboard = [];
    StudentDetails.codechefLeaderboard = [];
  var reqBody = {
    "value" : StudentDetailsReport.finalReport,
    "username" : userCredentials.get_user(),
    "type" : userCredentials.get_user_type()
  };
  print(reqBody);
  var response = await http.post(
    Uri.parse(userCredentials.IP+"/leaderBoard"),
    headers: {"content-Type": "application/json"},
    body: jsonEncode(reqBody),
  );
  var decodeResponse = jsonDecode(response.body);
  List<dynamic> leetcodeLeaderboard;
  List<dynamic> codechefLeaderboard;
  List<dynamic> codeforcesLeaderboard;
  if (decodeResponse["status"]) {
    leetcodeLeaderboard = List<dynamic>.from(decodeResponse["leetcode"]);
    codechefLeaderboard = List<dynamic>.from(decodeResponse["codechef"]);
    codeforcesLeaderboard = List<dynamic>.from(decodeResponse["codeforces"]);
    StudentDetails.leetcodeLeaderboard = leetcodeLeaderboard;
    StudentDetails.codeforcesLeaderboard = codeforcesLeaderboard;
    StudentDetails.codechefLeaderboard = codechefLeaderboard;
    return true;
  }
  return false;
}