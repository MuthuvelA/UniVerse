
import 'package:flutter/cupertino.dart';

class StudentDetailsReport {
  List<String> personalDetails = [
    "name",
    "department",
    "rollNo",
        "emailAddress",
    "phoneNumber",
    "dateOfBirth",
    "address",
    "fatherName",
    "motherName",
    "bloodGroup",
    "aadhaarCardNumber",
    "aadhaarCardLink",
    "panCardNumber",
    "panCardLink",
    "drivingLicenseNumber",
    "drivingLicenseLink",
    "voterIdNumber",
    "voterIdLink",
    "passportNumber",
    "passportLink",
    "bankAccountNumber",
    "bankAccountLink",
  ];
  List<String> codingDetails = [
    "leetcode",
    "codechef",
    "codeforces"
  ];

  static Map<String,dynamic> finalReport = {};
  static Map<String,dynamic> personalMap = {};
  static Map<String,dynamic> codingMap = {};

  void allAboutStudent(List<TextEditingController> personal,List<TextEditingController> coding){
    for(int i=0;i<personal.length;i++){
     if(personal[i].text.isNotEmpty){
       personalMap[personalDetails[i]] = personal[i].text;
     }
    }
    for(int i=0;i<coding.length;i++){
      if(coding[i].text.isNotEmpty){
        codingMap[codingDetails[i]] = coding[i].text;
      }
    }
    finalReport = {
      "personal" : personalMap,
      "coding" : codingMap
    };
    print(finalReport);
  }
}