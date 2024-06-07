import 'package:flutter/material.dart';
import 'package:universe/component/utils/credentials.dart';
import 'package:universe/component/utils/student_details.dart';
import 'package:universe/component/utils/student_details_report.dart';
import 'package:universe/component/view/student_dashboard_view.dart';
import 'package:universe/service/student_details_service.dart';
import 'package:universe/service/username_validation.dart';

class StudentCodingDetailsForm extends StatefulWidget {
  const StudentCodingDetailsForm({super.key, required this.personalDetailsController});
  final List<TextEditingController> personalDetailsController;

  @override
  State<StudentCodingDetailsForm> createState() => _StudentCodingDetailsFormState();
}

class _StudentCodingDetailsFormState extends State<StudentCodingDetailsForm> {
  String prevValue = "";
  String prevCodechef = "";
  String prevCodeforces = "";

  TextEditingController leetcodeController = TextEditingController();
  TextEditingController codechefController = TextEditingController();
  TextEditingController codeforcesController = TextEditingController();
  late List<bool> codingDetailsValidation;
  late List<bool> isEditable;
  bool isLoading = false;
  List<String> codingDetails = StudentDetails.getCodingDetails();
  late List<TextEditingController> codingDetailsController = [
    leetcodeController,
    codechefController,
    codeforcesController
  ];

  @override
  void initState() {
    isEditable = List<bool>.filled(codingDetails.length, false);
    codingDetailsValidation = List<bool>.filled(codingDetails.length,true);
    for (int i = 0; i < codingDetails.length; i++) {
      codingDetailsController[i].text = codingDetails[i];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fill Your Coding Details",
          style: TextStyle(fontFamily: "Raleway", fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: bodyPartOfForm()),
    );
  }

  Widget bodyPartOfForm() {
    List<String> codingDetailsLabels = [
      "Leetcode",
      "Codechef",
      "Codeforces"
    ];
    List<String> prevValue = [
      StudentDetails.personalMap["leetcode"],
      StudentDetails.personalMap["codechef"],
      StudentDetails.personalMap["codeforces"]
    ];
    StudentDetailsReport studentDetailsReport = StudentDetailsReport();
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      child: Column(
        children: [
          Column(
            children: List.generate(codingDetailsLabels.length, (index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black, width: 1)),
                                child: TextFormField(
                                  enabled: isEditable[index],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: codingDetailsLabels[index],
                                    hintStyle: const TextStyle(
                                        fontFamily: "Raleway-SemiBold",
                                        fontSize: 16,
                                        color: Colors.grey),
                                  ),
                                  controller: codingDetailsController[index],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isEditable[index] ? Icons.check : Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                isEditable[index] = !isEditable[index];
                                if(isEditable[index]==false){
                                  if(prevValue[index]==codingDetailsController[index].text){
                                    codingDetailsValidation[index] = true;
                                  }else {
                                    codingDetailsValidation[index] = false;
                                  }
                                }else {
                                  codingDetailsValidation[index] = false;
                                }
                              });
                            },
                          ),
                          MaterialButton(
                            onPressed: () async {
                              isEditable[index] = false;
                              bool decider = await usernameValidation(codingDetailsController[index],codingDetailsLabels[index]);
                              setState(() {
                                codingDetailsValidation[index] = decider;
                              });
                            },
                            color: codingDetailsValidation[index] ? Color(0xFF27397A) : Colors.red,
                            child: const Text(
                              "Validate",
                              style: TextStyle(
                                  fontFamily: "Raleway-SemiBold",
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20))
                ],
              );
            }),
          ),
          Center(
            child: MaterialButton(
              onPressed: () async {

                if(codingDetailsValidation[0] && codingDetailsValidation[1] && codingDetailsValidation[2]){                
                studentDetailsReport.allAboutStudent(
                    widget.personalDetailsController, codingDetailsController);
                bool decider = await addStudentDetails();
                bool detailsDecider = await getStudentDetails();
                if (decider && detailsDecider) {
                  Navigator.push(context, (MaterialPageRoute(builder: (context) =>  StudentDashboardView(post: StudentDetails.post))));
                }
                }else{
                  alert(context, "Please validate before submit");
                }
              },
              color: Color(0xFF27397A),
              child: const Text(
                "Submit",
                style: TextStyle(
                    fontFamily: "Raleway-SemiBold",
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
        ],
      ),
    );
  }
}

void alert(BuildContext context,String data) {
  showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alert'),
          content: Text(data),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
}