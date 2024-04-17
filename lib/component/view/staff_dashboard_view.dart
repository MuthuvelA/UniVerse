import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universe/component/view/create_post_view.dart';
import 'package:universe/component/view/generate_excel_view.dart';
import 'package:universe/component/view/login_view.dart';
import 'package:universe/component/view/staff_profile_view.dart';
import 'package:universe/component/view/student_details_view.dart';
import 'package:universe/service/excel_download.dart';

class StaffDashboardView extends StatefulWidget {
  const StaffDashboardView({super.key});

  @override
  State<StaffDashboardView> createState() => _StaffDashboardViewState();
}

class _StaffDashboardViewState extends State<StaffDashboardView> {
  ExcelDownload excelDownload = ExcelDownload();
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
            title: Text("Department",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () async {
              print("do something");
           String filePath = await excelDownload.createExcel("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");
              String url =filePath;
              String fileName = "sample.xlsx";
              await excelDownload.downloadFile(url, fileName);

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
        border: Border.all(color: Colors.black,width: 1.0),
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
