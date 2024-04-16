
class ReportList{
  List<String> studentDetails = [
    "Name",
    "Roll Number",
    "Email Address",
    "Phone Number",
    "Date of Birth",
    "Address",
    "Parent Name",
    "Mother Name",
    "Blood Group",
    "LeetCode ",
    "CodeChef ",
    "Codeforces ",
    "Aadhaar Card Number",
    "PAN Card Number",
    "Driving License Number",
    "Voter ID Number",
    "Passport Number",
    "Bank Account Number",
    "Birth Certificate",
  ];
   List<String> personalList = [];
   List<String> coding = [];
   Map<String,dynamic> finalJson ={};
  void list(List<bool> checkboxDetails){
    for(int i=0;i<checkboxDetails.length;i++){
      if(studentDetails[i] == "Department") {
        continue;
      }
      if(i>=9 && i<=11 && checkboxDetails[i] == true){
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