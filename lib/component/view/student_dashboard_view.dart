import 'package:flutter/material.dart';
import 'package:universe/component/utils/credentials.dart';
import 'package:universe/component/utils/student_details.dart';
import 'package:universe/component/view/student_leaderboard_view.dart';
import 'package:universe/component/view/student_personal_details_form_view.dart';
import 'package:universe/component/view/student_profile.dart';
import 'package:universe/service/student_details_service.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentDashboardView extends StatefulWidget {
  final List<dynamic>post;
  const StudentDashboardView({super.key,required this.post});

  @override
  State<StudentDashboardView> createState() => _StudentDashboardViewState();
}

class _StudentDashboardViewState extends State<StudentDashboardView> {
  String name = StudentDetails.personalMap["name"];
  String email = StudentDetails.personalMap["emailAddress"];
  List<dynamic> notification = StudentDetails.notificationDetails;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          // title: const Text("Student Dashboard"),
          // centerTitle: true,
          title: Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    showNotification();
                  }
                  , icon: Icon(Icons.notifications)
              ),
            ]
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
            child: bodyPartOfDashboard(width,height)),
        drawer: drawerForStudent()
    );
  }

  Future showNotification() {
    return showMenu(
        context: context,
        position: RelativeRect.fromLTRB(100, 100, 0, 0),
        items: [
          PopupMenuItem(
            child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                color: Colors.white,
                // Set the background color to white
                child: Column(
                  children: [
                    Text(
                        "There are ${notification.length} Notifications",
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: List.generate(notification.length, (index) {
                        return Text("Your ${notification[index]["platform"]} platform  username : ${notification[index]["userName"]} is invalid");
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }
  Widget drawerForStudent() {
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
                accountName: Text("$name", style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                accountEmail: Text("$email", style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/image/drawerLogo.png"),
                ),
                currentAccountPictureSize: Size.square(40),
              )),
          ListTile(
            leading: Icon(Icons.person_2_outlined),
            title: Text("My profile",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => const UserProfile())));
            },
          ),
          ListTile(
            leading: Icon(Icons.post_add_outlined),
            title: Text("Registration",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentDetailsFormView()));
            },
          ),
          ListTile(
            leading: Icon(Icons.leaderboard),
            title: Text("Leaderboard",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () async{
              await getLeaderboard();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentLeaderboard()));
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
          const Padding(padding: EdgeInsets.only(top: 10)),
          quickRecap(),
        ],
      ),
    );
  }
  Widget quickRecap(){
    return Column(
      children: List.generate(widget.post.length, (index) {
        return GestureDetector(
          onTap: () {
            launchUrl(widget.post[index]["link"]);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1),
                      color: const Color(0xFF27397A)
                  ),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Center(
                        child: Text(widget.post[index]["title"]!,style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text(widget.post[index]["content"]!,
                          style: const TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 16,color: Colors.white),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      // widget.post[index]["postType"] != ' ' ? Text(widget.post[index]["postType"]!,style: const TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),) : const Text("Admin",style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white)),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
          ),
        );
      }),
    );
  }
  Future _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget welcomeBackCard(double width, double height){
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black,width: 1.0),
          color: const Color(0xFF27397A)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(" April 15, 2024",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14,color: Colors.grey.shade400),),
            Padding(padding: EdgeInsets.only(top: height/20)),
            Text("Welcome Back, $name!",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
            const Padding(padding: EdgeInsets.only(top: 3)),
            Text("Always Stay Updated :)",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14,color: Colors.grey.shade400),),
            const Padding(padding: EdgeInsets.only(top: 20))
          ],
        ),
      ),
    );
  }
}
