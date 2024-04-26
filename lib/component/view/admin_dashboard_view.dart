import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universe/component/view/create_post_view.dart';
import 'package:universe/component/view/staff_details_view.dart';
import 'package:universe/component/view/student_details_view.dart';

class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({super.key});

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
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
    List<String> staffNames = [
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
            child: bodyPartOfDashboard(width,height,studentNames,staffNames)),
        drawer: drawerForStaff()
    );
  }

  Widget bodyPartOfDashboard(double width, double height, List<String> studentNames, List<String> staffNames){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          welcomeBackCard(width,height),
          const SizedBox(height: 50,), const Text("Quick Recap",style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
          quickRecap(width,height,studentNames,staffNames),
        ],
      ),
    );
  }

  Widget quickRecap(double width,double height, List<String> studentNames, List<String> staffNames){
    List<String> title = ["CCE","CSE","ECE","MECH","AIDS","AIML","CSBS","IT"];
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      children: List.generate(title.length, (index) {
        return Container(
          height: height/12,
          width: width/12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF27397A)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              Text(title[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, (MaterialPageRoute(builder: (context) => StudentDetailsView(studentDetails: studentNames))));
                },
                  child: const Text("Student Details",style: TextStyle(fontFamily: "Raleway",fontSize: 14,color: Colors.grey),)),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, (MaterialPageRoute(builder: (context) =>  StaffDetailsView(staffDetails: staffNames))));
                },
                  child: const Text("Staff Details",style: TextStyle(fontFamily: "Raleway",fontSize: 14,color: Colors.grey),)),
            ],
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
            const Text("Welcome Back, Kamalesh!",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
            Padding(padding: EdgeInsets.only(top: 3)),
            Text("Always Stay Updated :)",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14,color: Colors.grey.shade400),),
            Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      ),
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

            },
          ),

          ListTile(
            leading: const Icon(Icons.post_add_outlined),
            title: const Text("Create post",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePostView()));
            },
          ),
        ],
      ),
    );
  }
}
