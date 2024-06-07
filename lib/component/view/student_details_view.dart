import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universe/component/view/student_profile.dart';

class StudentDetailsView extends StatefulWidget {
  StudentDetailsView({super.key,required this.studentDetails});
  final List<String> studentDetails;

  @override
  State<StudentDetailsView> createState() => _StudentDetailsViewState();
}

class _StudentDetailsViewState extends State<StudentDetailsView> {
  @override
  Widget build(BuildContext context) {
    int len = widget.studentDetails.length;
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details",style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.black),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: bodyPartForStudentDetails(len),
          )
      ),
    );
  }
  Widget bodyPartForStudentDetails(int len){
    return Column(
      children: List.generate(len, (index) {
        return Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            GestureDetector(
              onTap: () {
                Navigator.push(context, (MaterialPageRoute(builder: (context) => const UserProfile())));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1),
                    color: const Color(0xFF27397A)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(
                        children: [
                          Icon(Icons.person_2_outlined),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          Text("${widget.studentDetails[index]}",style: TextStyle(color: Colors.white,fontFamily: "Raleway-SemiBold",fontSize: 17),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
          ],
        );
      }),
    );
  }
}
