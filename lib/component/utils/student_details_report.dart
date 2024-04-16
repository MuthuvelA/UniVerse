
import 'package:flutter/cupertino.dart';

class StudentDetailsReport {
  List<String> personalDetails = [
    "Name",
    "Roll No",
    "Department",
        "Email Address",
    "Phone Number",
    "Date of Birth",
    "Address",
    "Parent Name",
    "Mother Name",
    "Blood Group",
    "Aadhaar Card Number",
    "Aadhaar Card Link",
    "PAN Card Number",
    "PAN Card Link",
    "Driving License Number",
    "Driving License Link",
    "Voter ID Number",
    "Voter ID Link",
    "Passport Number",
    "Passport Link",
    "Bank Account Number",
    "Bank Account Link",
  ];
  List<String> codingDetails = [
    "leetcode",
    "codechef",
    "codeforces"
  ];
  Map<String,dynamic> finalReport = {};
  Map<String,dynamic> personalMap = {};
  Map<String,dynamic> codingMap = {};
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