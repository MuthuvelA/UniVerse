import 'package:flutter/material.dart';
import 'package:universe/component/utils/student_details.dart';

class StudentLeaderboard extends StatefulWidget {
  const StudentLeaderboard({super.key});

  @override
  State<StudentLeaderboard> createState() => _StudentLeaderboardState();
}

class _StudentLeaderboardState extends State<StudentLeaderboard> {
  String selectedPlatform = "Leetcode";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "STUDENT LEADERBOARD",
          style: TextStyle(
            fontFamily: "Raleway",
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF27397A),
      ),
      body: bodyPartOfLeaderboard(context),
    );
  }

  Widget bodyPartOfLeaderboard(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(width / 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedPlatform = "Leetcode";
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return selectedPlatform == "Leetcode" ? const Color.fromARGB(255, 156, 233, 159) : Colors.white;
                    },
                  ),
                ),
                child: const Text("Leetcode"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedPlatform = "Codeforce";
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return selectedPlatform == "Codeforce" ? const Color.fromARGB(255, 156, 233, 159) : Colors.white;
                    },
                  ),
                ),
                child: const Text("Codeforce"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedPlatform = "Codechef";
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return selectedPlatform == "Codechef" ? const Color.fromARGB(255, 156, 233, 159) : Colors.white;
                    },
                  ),
                ),
                child: const Text("Codechef"),
              ),
            ],
          ),
          
          const SizedBox(height: 20),  // Add some space between buttons and the content

          Expanded(child: getSelectedPlatformWidget(width,height)),
        ],
      ),
    );
  }


  Widget getSelectedPlatformWidget(double width,double height) {
    switch (selectedPlatform) {
      case "Leetcode":
        return Leetcode_leaderboard(width,height);
      case "Codeforce":
        return codeforce_leaderboard(width,height);
      case "Codechef":
        return codechef_leaderboard(width,height);
      default:
        return Container();
    }
  }

  Widget codechef_leaderboard(double width,double height) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: List.generate(StudentDetails.codechefLeaderboard.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: width/20),
                child: Container(
                    width: width,
                    height: height/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width/30),
                      border: Border.all(color : Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 243, 238, 238).withOpacity(0.5),
                          spreadRadius: 4.8,
                          blurRadius: 7,
                          offset: const Offset(0, 3), 
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width/30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(),
                          Text("${StudentDetails.codechefLeaderboard[index]["username"]}"),
                          Text("${StudentDetails.codechefLeaderboard[index]["rating"]}")
                      ],
                      ),
                    ),
                  ),
              );
              },
            )
          ),
        ],
      ),
    );
  }

  Widget Leetcode_leaderboard(double width, double height) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: List.generate(StudentDetails.codechefLeaderboard.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: width/20),
                child: Container(
                    width: width,
                    height: height/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width/30),
                      border: Border.all(color : Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 243, 238, 238).withOpacity(0.5),
                          spreadRadius: 4.8,
                          blurRadius: 7,
                          offset: const Offset(0, 3), 
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width/30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(),
                          Text("${StudentDetails.leetcodeLeaderboard[index]["username"]}"),
                          Text("${StudentDetails.leetcodeLeaderboard[index]["rating"]}")
                      ],
                      ),
                    ),
                  ),
              );
              },
            )
          ),
        ],
      ),
    );
  }

  Widget codeforce_leaderboard(double width,double height) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: List.generate(StudentDetails.codechefLeaderboard.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: width/20),
                child: Container(
                    width: width,
                    height: height/10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width/30),
                      border: Border.all(color : Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 243, 238, 238).withOpacity(0.5),
                          spreadRadius: 4.8,
                          blurRadius: 7,
                          offset: const Offset(0, 3), 
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width/30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(),
                          Text("${StudentDetails.codeforcesLeaderboard[index]["username"]}"),
                          Text("${StudentDetails.codeforcesLeaderboard[index]["rating"]}")
                      ],
                      ),
                    ),
                  ),
              );
              },
            )
          ),
        ],
      ),
    );
  }
}
