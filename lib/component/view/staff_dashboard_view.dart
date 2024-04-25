import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart'as excel;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:universe/component/view/create_post_view.dart';
import 'package:universe/component/view/generate_excel_view.dart';
import 'package:universe/component/view/staff_profile_view.dart';
import 'package:universe/component/view/student_details_view.dart';
import 'package:universe/service/excel_download.dart';
import 'package:universe/service/excel_download.dart';

class StaffDashboardView extends StatefulWidget {
  const StaffDashboardView({super.key});

  @override
  State<StaffDashboardView> createState() => _StaffDashboardViewState();
}

class _StaffDashboardViewState extends State<StaffDashboardView> {
  // ExcelDownload excelDownload = ExcelDownload();
  @override
  Widget build(BuildContext context) {
    List<String> studentNames = [
      'Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry',
      'Isabel', 'Jack', 'Katie', 'Liam', 'Mia', 'Nathan', 'Olivia', 'Patrick',
      'Quinn', 'Rachel', 'Samuel', 'Tina', 'Ursula', 'Victor', 'Wendy', 'Xander',
      'Yvonne', 'Zack', 'Anna', 'Benjamin', 'Catherine', 'Daniel', 'Emily', 'Finn',
      'Gabriella', 'Hannah', 'Isaac', 'Jessica', 'Kevin', 'Lily', 'Matthew', 'Nora',
      'Oscar', 'Penelope', 'Quentin', 'Rebecca', 'Sophia', 'Thomas', 'Uma', 'Vincent',
      'Willow', 'Xavier', 'Yasmine', 'Zara', 'Aaron', 'Bella', 'Caleb', 'Daisy',
      'Ethan', 'Faith', 'Gavin', 'Holly', 'Ian', 'Jasmine', 'Kyle', 'Luna'
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartOfDashboard(width,height,studentNames)),
      drawer: drawerForStaff()
    );
  }
  Widget drawerForStaff() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xFF27397A)
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Color(0xFF27397A)
                ),
                accountName: Text("Megala Rangith", style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                accountEmail: Text("megala.2022cce@sece.ac.in", style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/image/drawerLogo.png"),
                ),
                currentAccountPictureSize: Size.square(40),
              )),
          ListTile(
            leading: Icon(Icons.person_2_outlined),
            title: Text("My profile",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => const StaffProfileView())));
            },
          ),
        ListTile(
            leading: Icon(Icons.school_outlined),
            title: const Text(
              "Department",
              style: TextStyle(fontFamily: "Raleway-SemiBold", fontSize: 17),
            ),
            onTap: () async {

              print("do something");
              String base64 = "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";
              List<int> bytes = base64Decode(base64);

              // Convert the list of bytes to a Uint8List
              Uint8List byteList = Uint8List.fromList(bytes);
              excelDownload.saveExcel("sample", byteList);
              print("success");
           },
          ),

          ListTile(
            leading: Icon(Icons.post_add_outlined),
            title: Text("Create post",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePostView()));
            },
          ),
          ListTile(
            leading: Icon(Icons.document_scanner_outlined),
            title: Text("Generate Excel Sheet",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => const GenetateExcelView())));
            },
          )
        ],
      ),
    );
  }
  Widget bodyPartOfDashboard(double width, double height, List<String> studentNames){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          welcomeBackCard(width,height),
          SizedBox(height: 50,),
          Text("Quick Recap",style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
          quickRecap(width,height,studentNames),
        ],
      ),
    );
  }
  Widget quickRecap(double width,double height,List<String> studentNames){
    List<String> title = ["Handling Student","Placed","Not Placed","As Intern"];
    List<int> noStudent = [64,30,10,24];
    return GridView.count(
        crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, (MaterialPageRoute(builder: (context) => StudentDetailsView(studentDetails: studentNames))));
            // this will be changed ASAP
          },
          child: Container(
            height: height/12,
            width: width/12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: Color(0xFF27397A)
             //  boxShadow: [
             //    BoxShadow(
             //      color: Colors.black.withOpacity(1),
             //      spreadRadius: 4,
             //      blurRadius: 20,
             //      offset: Offset(2, 8),
             //    ),
             //
             //  ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 30)),
                Text("${title[index]}",style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
                Padding(padding: EdgeInsets.only(top: 50)),
                Text("No of Students : ${noStudent[index]}",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 15,color: Colors.white),)
              ],
            ),
          ),
        );
      }),
    );
  }
  Widget welcomeBackCard(double width, double height){
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return Container(
      // height: height/6,
       width: width,
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
            Text("Welcome Back, Prakash!",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
            Padding(padding: EdgeInsets.only(top: 3)),
            Text("Always Stay Updated :)",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14,color: Colors.grey.shade400),),
             Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      ),
    );
  }
}
