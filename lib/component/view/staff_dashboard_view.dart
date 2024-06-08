
import 'package:flutter/material.dart';
import 'package:universe/component/utils/staff_details.dart';
import 'package:universe/component/utils/student_details.dart';
import 'package:universe/component/view/create_post_view.dart';
import 'package:universe/component/view/generate_excel_view.dart';
import 'package:universe/component/view/login_view.dart';
import 'package:universe/component/view/staff_profile_view.dart';
import 'package:universe/component/view/student_details_view.dart';

class StaffDashboardView extends StatefulWidget {
  const StaffDashboardView({super.key});

  @override
  State<StaffDashboardView> createState() => _StaffDashboardViewState();
}

class _StaffDashboardViewState extends State<StaffDashboardView> {
  //ExcelDownload excelDownload = ExcelDownload();
  List<String> studentNames = StaffDetails().getNameOfAllStudent();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartOfDashboard(width,height)),
      drawer: drawerForStaff()
    );
  }
  Widget drawerForStaff() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
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
            leading: const Icon(Icons.person_2_outlined),
            title: const Text("My profile",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => const StaffProfileView())));
            },
          ),

          ListTile(
            leading: const Icon(Icons.post_add_outlined),
            title: const Text("Create post",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePostView()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.document_scanner_outlined),
            title: const Text("Generate Excel Sheet",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => const GenetateExcelView())));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout", style: TextStyle(fontFamily: "Raleway-SemiBold", fontSize: 17),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
            },
          ),
        ],
      ),
    );
  }
  Widget bodyPartOfDashboard(double width, double height){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          welcomeBackCard(width,height),
          const SizedBox(height: 50,),
          const Text("Quick Recap",style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
          quickRecap(width,height),
        ],
      ),
    );
  }
  Widget quickRecap(double width,double height){
    List<String> title = ["Handling Student","Placed","Not Placed","As Intern"];
    List<int> noStudent = [StaffDetails.allAboutStudent.length,StaffDetails.placed.length,StaffDetails.nonPlaced.length,StaffDetails.intern.length];
    return GridView.count(
        crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            if (title[index] == "Placed") {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => StudentDetailsView(studentDetails: StaffDetails.placed))));
            }
            else if (title[index] == "As Intern") {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => StudentDetailsView(studentDetails: StaffDetails.intern))));
            }
            else if (title[index] == "Not Placed") {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => StudentDetailsView(studentDetails: StaffDetails.nonPlaced))));
            }
            else
            Navigator.push(context, (MaterialPageRoute(builder: (context) => StudentDetailsView(studentDetails: StaffDetails.allAboutStudent))));
            // this will be changed ASAP
          },
          child: Container(
            height: height/12,
            width: width/12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF27397A)
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
                const Padding(padding: EdgeInsets.only(top: 30)),
                Text(title[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
                const Padding(padding: EdgeInsets.only(top: 50)),
                Text("No of Students : ${noStudent[index]}",style: const TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 15,color: Colors.white),)
              ],
            ),
          ),
        );
      }),
    );
  }
  Widget welcomeBackCard(double width, double height){
    // DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
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
            const Text("Welcome Back, Prakash!",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
            Padding(padding: EdgeInsets.only(top: 3)),
            Text("Always Stay Updated :)",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14,color: Colors.grey.shade400),),
             Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      ),
    );
  }
}
