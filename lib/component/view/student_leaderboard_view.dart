import 'package:flutter/material.dart';

class StudentLeaderboard extends StatefulWidget {
  const StudentLeaderboard({super.key});

  @override
  State<StudentLeaderboard> createState() => _StudentLeaderboardState();
}

class _StudentLeaderboardState extends State<StudentLeaderboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "STUDENT LEADERBOARD",
          style: TextStyle(
            fontFamily: "Raleway",
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF27397A),
      ),
      body: bodyPartOfLeaderboard(),
    );
  }

  Widget bodyPartOfLeaderboard() {
    return Column(
      children: [

      ],
    );
  }
}
