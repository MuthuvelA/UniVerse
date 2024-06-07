class StudentDetails {
  static Map<String,dynamic> personalMap = {};
  static Map<String,dynamic> codingMap = {};
  static List<String> personalDetails = [];
  static List<String> codingDetails = [];
  static List<dynamic> post = [];
  static List<dynamic> notificationDetails = [];
  static List<dynamic> leetcodeLeaderboard = [];
  static List<dynamic> codechefLeaderboard = [];
  static List<dynamic> codeforcesLeaderboard = [];

  static List<String> getPersonalDetails() {
    personalMap.forEach((key, value) {
      if (key != "__v" && key != "_id" && key != "leetcode" && key != "codechef" && key != "currentYear" && key != "codeforces" && key != "parentName" && key != "invalidUserName") {
        if (value != "" && value != null) {
          personalDetails.add(value);
          print("Iam from not null");
        }
        else {
          personalDetails.add("");
          print("Iam from not null");
        }
      }
    });
    print("Form Student details model : $personalDetails");
    return personalDetails;
  }
  static List<String> getCodingDetails() {
    codingDetails.add(personalMap["leetcode"]);
    codingDetails.add(personalMap["codechef"]);
    codingDetails.add(personalMap["codeforces"]);
    return codingDetails;
  }
}