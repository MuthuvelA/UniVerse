import 'package:flutter/material.dart';
import 'package:universe/component/view/student_personal_details_form_view.dart';
import 'package:universe/component/view/student_profile.dart';

class StudentDashboardView extends StatefulWidget {
  final List<dynamic>post;
  const StudentDashboardView({super.key,required this.post});

  @override
  State<StudentDashboardView> createState() => _StudentDashboardViewState();
}

class _StudentDashboardViewState extends State<StudentDashboardView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(title: const Text(""),),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
            child: bodyPartOfDashboard(width,height)),
        drawer: drawerForStudent()
    );
  }
  Widget drawerForStudent() {
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
                accountName: Text("Gopinath S", style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                accountEmail: Text("gopinath.s2022cce@sece.ac.in", style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14),),
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
            leading: Icon(Icons.school_outlined),
            title: Text("Department",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {

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
            title: Text("Performance",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),),
            onTap: () {

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
        return Padding(
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
                    widget.post[index]["postType"] != ' ' ? Text(widget.post[index]["postType"]!,style: const TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white),) : const Text("Admin",style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.white)),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        );
      }),
    );
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
            const Text("Welcome Back, Gopinath!",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
            const Padding(padding: EdgeInsets.only(top: 3)),
            Text("Always Stay Updated :)",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 14,color: Colors.grey.shade400),),
            const Padding(padding: EdgeInsets.only(top: 20))
          ],
        ),
      ),
    );
  }
}
