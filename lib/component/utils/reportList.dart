
class ReportList{
  List<String> studentDetails = [
    "emailAddress",
    "phoneNumber",
    "dateOfBirth",
    "address",
    "parentName",
    "motherName",
    "bloodGroup",
    "leetCode",
    "codeChef",
    "codeforces",
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
   List<String> personalList = [];
   List<String> coding = [];
   Map<String,dynamic> finalJson ={};
  void list(List<bool> checkboxDetails){
    for(int i=0;i<checkboxDetails.length;i++){
      if(studentDetails[i] == "Department") {
        continue;
      }
      if(i>=7 && i<=9 && checkboxDetails[i] == true){
        coding.add(studentDetails[i]);
      }
      else if(checkboxDetails[i] == true){
        personalList.add(studentDetails[i]);
      }
    }
    finalJson = {
      "department":'CCE',
    "year":2,
    "personal": personalList,
    "coding": coding




  };
    print(finalJson);
  }
}