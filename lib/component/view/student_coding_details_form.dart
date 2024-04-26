import 'package:flutter/material.dart';
import 'package:universe/component/utils/student_details_report.dart';
import 'package:universe/service/student_deatils_update_service.dart';
import 'package:universe/service/username_validation.dart';

class StudentCodingDetailsForm extends StatefulWidget {
  StudentCodingDetailsForm({super.key, required this.personalDetailsController});
  final List<TextEditingController> personalDetailsController;

  @override
  State<StudentCodingDetailsForm> createState() => _StudentCodingDetailsFormState();
}

class _StudentCodingDetailsFormState extends State<StudentCodingDetailsForm> {
  late List<bool> checkboxDetails;
  bool isLeet = false;
  bool isChef = false;
  bool isForce = false;
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
        title: const Text("Fill Your Coding Details",style: TextStyle(fontFamily: "Raleway",fontSize: 18),),
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
      "Leetcode",
      "Codechef",
      "Codeforces"
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
                                hintStyle: const TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.grey),
                              ),
                              controller: codingDetailsController[index],
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(onPressed: (){
                        setState(() async{
                          bool result = await usernameValidation(codingDetailsController[index],codingDetails[index]);
                          if(!result){
                            showAlertDialog(context,"Username not found");
                          }
                          if(codingDetails[index]=="Leetcode") isLeet = result;
                          else if(codingDetails[index]=="Codechef") isChef = result;
                          else isForce = result;
                        });
                      },
                        color: Color(0xFF27397A),
                      child: const Text("Validate",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20))
                ],
              );
            }),
          ),
          Center(
            child: MaterialButton(
              onPressed: () async{
                if((isLeet || leetcodeController.text.isEmpty) && (isChef || codechefController.text.isEmpty) && (isForce || codeforcesController.text.isEmpty)){
                    studentDetailsReport.allAboutStudent(widget.personalDetailsController, codingDetailsController);
                    await updateDetails();
                }else{
                  showAlertDialog(context,"please validate user first");
                }
              },
              color: const Color(0xFF27397A),
              child: const Text("Submit",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.white),),
            )
          ),
          const Padding(padding: EdgeInsets.only(top: 15)),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context,String data) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { 
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text(data),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}