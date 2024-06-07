import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universe/component/utils/student_details.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool decider = true;
  bool personalDecider = false;
  bool governDecider = false;
  bool bankDecider = false;
  bool referenceDecider = false;
  late List<bool> _selectedButtons;

  @override
  void initState() {
    super.initState();
    _selectedButtons = List<bool>.filled(2, false);
    _selectedButtons[0] = true;
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("PROFILE",style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
        backgroundColor: Color(0xFF27397A)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            welcomeBackCard(),
            Padding(padding: EdgeInsets.only(top: 50)),

        toggle(),
            if (decider)
              Performance(width, height)
            else
              groups(),

          ],
        ),
      ),
    );
  }
  Widget toggle(){
    return ToggleButtons(
      fillColor : Colors.white,
      renderBorder: false,
      // direction: Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _selectedButtons.length; i++) {
            _selectedButtons[i] = (i == index);
          }
          decider = (index == 0);
        });
      },
      borderRadius: BorderRadius.circular(10),
      // fillColor: Colors.blue[200],
      constraints: BoxConstraints(
        minHeight: 50,
        minWidth: 50,
      ),
      isSelected: _selectedButtons,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: _selectedButtons[0]
                  ? Colors.blue[400]
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: const Text(
              "Performance",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: _selectedButtons[1]
                  ? Colors.blue[400]
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: const Text(
              "Personal details",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        // else
        //   personalDetails()
      ],
    );
  }
  Widget welcomeBackCard(){
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Container(
        // height: height/6,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.black,width: 1.0),
            color: Color(0xFF27397A)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(" April 15, 2024",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14,color: Colors.grey.shade400),),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("Welcome Back, ${StudentDetails.personalMap["name"]}!",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
              Padding(padding: EdgeInsets.only(top: 3)),
              Text("Always Stay Updated :)",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14,color: Colors.grey.shade400),),
              Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        ),
      ),
    );
  }
  Widget referenceView(){
    List<String> refInfo = [
      "aadhaarCardLink",
      "panCardLink",
      "drivingLicenseLink",
      "voterIdLink",
      "passportLink",
      "bankAccountLink"
    ];
    List<String> refOut = [
      "khfsdkfds",
      "sfkshfds",
      "fjksdhf",
      "fhskfhs",
      "fhdskfhs",
      "dfsdhfsk"
    ];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 1),
          color: Color(0xFF27397A)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(refOut.length, (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(refInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
                    Text(refOut[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
                  ],
                );
              }),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
          ],
        ),
      ),
    );
  }
  Widget bankDetailsView(){
    List<String> bankInfo = [
      "Bank Account No",
      "Bank Account link"
    ];
    List<String> bankOut = [
      StudentDetails.personalMap["bankAccountNumber"] ?? "Please update it",
      StudentDetails.personalMap["bankAccountLink"] ?? "Please update it"
    ];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 1),
          color: Color(0xFF27397A)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(bankInfo.length, (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(bankInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
                    Text(bankOut[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
                  ],
                );
              }),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
          ],
        ),
      ),
    );
  }
  Widget governmentDocumentView(){
    List<String> governInfo = [
      "aadhaarCardNumber",
      "panCardNumber",
      "drivingLicense",
      "voterIdNumber",
      "passportNumber"
    ];
    List<String> governOut = [
      StudentDetails.personalMap["aadhaarCardLink"] ?? "Please update it" ,
      StudentDetails.personalMap["panCardNumber"] ?? "Please update it" ,
      StudentDetails.personalMap["drivingLicenseNumber"] ?? "Please update it" ,
      StudentDetails.personalMap["voterIdNumber"] ?? "Please update it" ,
      StudentDetails.personalMap["passportNumber"] ?? "Please update it"
    ];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 1),
          color: Color(0xFF27397A)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(governInfo.length, (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(governInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
                    Text(governOut[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
                  ],
                );
              }),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
          ],
        ),
      ),
    );
  }
  Widget personalInformationView(){
    List<String> personalInfo = [
      "emailAddress",
      "phoneNumber",
      "dateOfBirth",
      "address",
      'parentName',
      "motherName",
      "bloodGroup"
    ];
    List<String> personalOut = [
      StudentDetails.personalMap["emailAddress"] ?? "Please update it",
      StudentDetails.personalMap["phoneNumber"] ?? "Please update it",
      "01/05/2005",
      StudentDetails.personalMap["address"] ?? "Please update it",
      StudentDetails.personalMap["parentName"] ?? "Please update it",
      StudentDetails.personalMap["motherName"] ?? "Please update it",
      StudentDetails.personalMap["bloodGroup"] ?? "Please update it"
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black,width: 1),
            color: Color(0xFF27397A)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 15)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(personalInfo.length, (index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(personalInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
                      Text(personalOut[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
                    ],
                  );
                }),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
            ],
          ),
        ),
      ),
    );
  }
  Widget groups(){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                personalDecider = !personalDecider;
                governDecider = false;
                bankDecider = false;
                referenceDecider = false;
              });
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black,width: 1),
                  color: personalDecider ? Colors.blue : Color(0xFF27397A)
              ),
              child: Center(child: Text("Personal Information",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),)),
            ),
          ),
          if(personalDecider)
            personalInformationView(),
          Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {
              setState(() {
                personalDecider = false;
                governDecider = !governDecider;
                bankDecider = false;
                referenceDecider = false;
              });
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1),
                  color: governDecider ? Colors.blue : Color(0xFF27397A)
              ),
              child: Center(child: Text("Government ID's",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),)),
            ),
          ),
          if(governDecider)
            governmentDocumentView(),
          Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {
              setState(() {
                personalDecider = false;
                governDecider = false;
                bankDecider = !bankDecider;
                referenceDecider = false;
              });
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1),
                  color: bankDecider ? Colors.blue : Color(0xFF27397A)
              ),
              child: Center(child: Text("Bank Details",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),)),
            ),
          ),
          if(bankDecider)
            bankDetailsView(),
          Padding(padding: EdgeInsets.only(top: 20)),
          GestureDetector(
            onTap: () {
              setState(() {
                personalDecider = false;
                governDecider = false;
                bankDecider = false;
                referenceDecider = !referenceDecider;
              });
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1),
                  color: referenceDecider ? Colors.blue : Color(0xFF27397A)
              ),
              child: Center(child: Text("Reference Link",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),)),
            ),
          ),
          if(referenceDecider)
            referenceView()
        ],
      ),
    );
  }
  Widget Performance(double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width / 20),
              color: Color(0xFF27397A)
            ),
            width: width,
            height: height / 4.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  width: width/8,
                  height: width/8,
                  decoration: const BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage("assets/image/leetcode.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("Easy",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("Medium",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("Hard",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${StudentDetails.codingMap["leetcode"][1]["leetcodeEasy"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("${StudentDetails.codingMap["leetcode"][1]["leetcodeMedium"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("${StudentDetails.codingMap["leetcode"][1]["leetcodeHard"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                  ],
                ),

                SizedBox(
                  width: width/5,
                  height: width/5,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    value: 1,
                  ),
                ),
              ],
            ),
          ),

          Padding(padding: EdgeInsets.only(top: width / 20)),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width / 20),
              color: Color(0xFF27397A)
            ),
            width: width,
            height: height / 5,
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  width: width/8,
                  height: width/8,
                  decoration: const BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage("assets/image/icons8-codechef-50.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("No of problems solved",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("Rating",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("Star",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${StudentDetails.codingMap["codechef"][1]["codechefTotal"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("${StudentDetails.codingMap["codechef"][0]["codechefCurrentRating"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("${StudentDetails.codingMap["codechef"][0]["codechefStarRating"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),

          Padding(padding: EdgeInsets.only(top: width / 20)),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width / 20),
              color: Color(0xFF27397A)
            ),
            width: width,
            height: height / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                  width: width/8,
                  height: width/8,
                  decoration: const BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage("assets/image/codeforces.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("No of problems solved",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("Rating",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("Position",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${StudentDetails.codingMap["codeforces"][1]["codeforcesTotal"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("${StudentDetails.codingMap["codeforces"][0]["codeforcesRating"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                    Text("${StudentDetails.codingMap["codeforces"][0]["position"]}",style: TextStyle(fontFamily: "Raleway-SemiBold",color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),

          Padding(padding: EdgeInsets.only(top: width / 20)),
        ],
      ),
    );
  }
}