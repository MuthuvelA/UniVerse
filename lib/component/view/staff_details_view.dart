import 'package:flutter/material.dart';
import 'package:universe/component/view/staff_profile_view.dart';

class StaffDetailsView extends StatefulWidget {
  const StaffDetailsView({super.key,required this.staffDetails});
  final List<String> staffDetails;
  @override
  State<StaffDetailsView> createState() => _StaffDetailsViewState();
}

class _StaffDetailsViewState extends State<StaffDetailsView> {
  @override
  Widget build(BuildContext context) {
    int len = widget.staffDetails.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff Details",style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.black),),
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
                Navigator.push(context, (MaterialPageRoute(builder: (context) => const StaffProfileView())));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1),
                    color: const Color(0xFF27397A)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Row(
                        children: [
                          const Icon(Icons.person_2_outlined),
                          const Padding(padding: EdgeInsets.only(left: 5)),
                          Text("${widget.staffDetails[index]}",style: TextStyle(color: Colors.white,fontFamily: "Raleway-SemiBold",fontSize: 17),),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
          ],
        );
      }),
    );
  }
}
