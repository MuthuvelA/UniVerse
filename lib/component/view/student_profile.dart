import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      backgroundColor: const Color.fromARGB(255, 198, 208, 244),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width / 20),
          child: Column(
            children: [
              Container(
                width: width,
                height: height / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width / 20)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Prakash kumar",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Raleway",
                          fontSize: width / 10,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "CCE",
                        style: TextStyle(
                          fontFamily: "Raleway-SemiBold",
                          fontSize: width / 15,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "II year",
                        style: TextStyle(fontSize: width / 20),
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: width / 20)),

              Padding(
                padding: EdgeInsets.all(width/20),
                child: ToggleButtons(
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
                  borderRadius: BorderRadius.circular(width / 20),
                  // fillColor: Colors.blue[200],
                  constraints: BoxConstraints(
                    minHeight: width / 10,
                    minWidth: width / 20,
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
                        width: width/3,
                        height: height/10,
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
                        width: width/3,
                        height: height/10,
                        alignment: Alignment.center,
                        child: const Text(
                          "Personal details",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: width / 20)),

              if (decider)
                Performance(width, height)
              else
                groups(),

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
          color: Colors.white
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(refOut.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(refInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(refOut[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
                ],
              );
            }),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
        ],
      ),
    );
  }
  Widget bankDetailsView(){
    List<String> bankInfo = [
      "Bank Account No",
      "Bank Account link"
    ];
    List<String> bankOut = [
      "12345433",
      "fsdfskfh"
    ];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 1),
          color: Colors.white
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(bankInfo.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(bankInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(bankOut[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
                ],
              );
            }),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
        ],
      ),
    );
  }
  Widget governmentDocumentView(){
    List<String> governInfo = [
      "aadhaarCardNumber",
      "panCardNumber",
      "drivingLicenseNumber",
      "voterIdNumber",
      "passportNumber"
    ];
    List<String> governOut = [
      "1234",
      "4321",
      "0987",
      "7564",
      "47293"
    ];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 1),
          color: Colors.white
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(governInfo.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(governInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(governOut[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
                ],
              );
            }),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
        ],
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
      "abc@gmail.com",
      "9344751909",
      "01/052005",
      "1223",
      "Kumar",
      "Kumari",
      "A+"
    ];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 1),
          color: Colors.white
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(personalInfo.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(personalInfo[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(personalOut[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
                ],
              );
            }),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
        ],
      ),
    );
  }
  Widget groups(){
    return Column(
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
                color: personalDecider ? Colors.blue : Colors.white
            ),
            child: Center(child: Text("Personal Information")),
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
                color: governDecider ? Colors.blue : Colors.white
            ),
            child: Center(child: Text("Government ID's")),
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
                color: bankDecider ? Colors.blue : Colors.white
            ),
            child: Center(child: Text("Bank Details")),
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
                color: referenceDecider ? Colors.blue : Colors.white
            ),
            child: Center(child: Text("Reference Link")),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        if(referenceDecider)
          referenceView()
      ],
    );
  }
  Column Performance(double width, double height) {
    return Column(
      children: [

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width / 20),
            color: Colors.white,
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
                  Text("Easy"),
                  Text("Medium"),
                  Text("Hard"),
                ],
              ),

              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("10"),
                  Text("10"),
                  Text("10"),
                ],
              ),

              SizedBox(
                width: width/5,
                height: width/5,
                child: const CircularProgressIndicator(
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
            color: Colors.white,
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
                  Text("No of problems solved"),
                  Text("Rating"),
                  Text("Star"),
                ],
              ),

              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("10"),
                  Text("10"),
                  Text("3*"),
                ],
              ),
            ],
          ),
        ),

        Padding(padding: EdgeInsets.only(top: width / 20)),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width / 20),
            color: Colors.white,
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
                  Text("No of problems solved"),
                  Text("Rating"),
                  Text("Position"),
                ],
              ),

              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("10"),
                  Text("10"),
                  Text("Newbie"),
                ],
              ),
            ],
          ),
        ),

        Padding(padding: EdgeInsets.only(top: width / 20)),
      ],
    );
  }
}