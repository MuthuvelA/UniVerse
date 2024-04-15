import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universe/component/view/login_view.dart';
import 'package:universe/component/view/student_details_view.dart';

class StaffDashboardView extends StatefulWidget {
  const StaffDashboardView({super.key});

  @override
  State<StaffDashboardView> createState() => _StaffDashboardViewState();
}

class _StaffDashboardViewState extends State<StaffDashboardView> {
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

            },
          ),
          ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text("Department",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.post_add_outlined),
            title: Text("Create post",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {

            },
          ),
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
