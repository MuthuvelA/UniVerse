import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universe/component/model/student_details_report.dart';

class StudentCodingDetailsForm extends StatefulWidget {
  StudentCodingDetailsForm({super.key, required this.personalDetailsController});
  final List<TextEditingController> personalDetailsController;

  @override
  State<StudentCodingDetailsForm> createState() => _StudentCodingDetailsFormState();
}

class _StudentCodingDetailsFormState extends State<StudentCodingDetailsForm> {
  late List<bool> checkboxDetails;
  bool isLoading = false;
  List<String> codingDetails = [
    "Leetcode Username",
    "Codechef Username",
    "CodeForces Username"
  ];
  @override
  void initState(){
    super.initState();
    checkboxDetails = List<bool>.filled(codingDetails.length, false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Your Coding Details",style: TextStyle(fontFamily: "Raleway",fontSize: 18),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: bodyPartOfForm()),
    );
  }
  Widget bodyPartOfForm(){
    TextEditingController leetcodeController = TextEditingController();
    TextEditingController codechefController = TextEditingController();
    TextEditingController codeforcesController = TextEditingController();
    List<String> codingDetails = [
      "Leetcode Username",
      "Codechef Username",
      "CodeForces Username"
    ];
    List<TextEditingController> codingDetailsController = [
      leetcodeController,
      codechefController,
      codeforcesController
    ];
    StudentDetailsReport studentDetailsReport = StudentDetailsReport();
    return Padding(
      padding: const EdgeInsets.only(top:30,left: 15,right: 15),
      child: Column(
        children: [
          Column(
            children: List.generate(codingDetails.length, (index) {
              return  Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black,width: 1)
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: codingDetails[index],
                                hintStyle: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.grey),
                              ),
                              controller: codingDetailsController[index],
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(onPressed: (){

                      },
                      child: Text("Validate",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
                        color: Color(0xFF27397A),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 20))
                ],
              );
            }),
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                studentDetailsReport.allAboutStudent(widget.personalDetailsController, codingDetailsController);
              },
              child: Text("Submit",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.white),),
              color: Color(0xFF27397A),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
        ],
      ),
    );
  }
}
