import 'package:universe/component/utils/student_details.dart';

class StaffDetails {
  static List<dynamic> allAboutStudent = [];
  static List<dynamic> placed = [];
  static List<dynamic> intern = [];
  static List<dynamic> nonPlaced = [];
  static List<String> result =[];


  List<String> getNameOfAllStudent() {
    print(allAboutStudent);
    for (int i=0;i<allAboutStudent.length;i++) {
      result.add(allAboutStudent[i]["name"]);
    }
    return result;
  }

  static void setProfile(Map<String,dynamic> userDetails) {

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
    StudentDetails.personalMap = personalDetails;
    StudentDetails.codingMap = codingDetails;
  }
}