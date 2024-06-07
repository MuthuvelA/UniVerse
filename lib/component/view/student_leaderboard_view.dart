import 'package:flutter/material.dart';
import 'package:universe/component/utils/student_details.dart';

class StudentLeaderboard extends StatefulWidget {
  const StudentLeaderboard({super.key});

  @override
  State<StudentLeaderboard> createState() => _StudentLeaderboardState();
}

class _StudentLeaderboardState extends State<StudentLeaderboard> {
  String selectedPlatform = "Leetcode";  // Default selected platform

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
                child: const Text("Leetcode"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedPlatform = "Codeforce";
                  });
                },
                child: const Text("Codeforce"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedPlatform = "Codechef";
                  });
                },
                child: const Text("Codechef"),
              ),
            ],
          ),
          SizedBox(height: 20),  // Add some space between buttons and the content
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
    return Column(
      children: [
        Column(
          children: List.generate(StudentDetails.codechefLeaderboard.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${StudentDetails.codechefLeaderboard[index]["username"]}"),
                  Text("${StudentDetails.codechefLeaderboard[index]["rating"]}")
              ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget Leetcode_leaderboard(double width, double height) {
    return Column(
      children: [
        Column(
          children: List.generate(StudentDetails.leetcodeLeaderboard.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${StudentDetails.leetcodeLeaderboard[index]["username"]}"),
                  Text("${StudentDetails.leetcodeLeaderboard[index]["rating"]}")
              ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget codeforce_leaderboard(double width,double height) {
    return Column(
      children: [
        Column(
          children: List.generate(StudentDetails.codechefLeaderboard.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${StudentDetails.codeforcesLeaderboard[index]["username"]}"),
                  Text("${StudentDetails.codeforcesLeaderboard[index]["rating"]}")
              ],
              ),
            );
          }),
        )
      ],
    );
  }
}
