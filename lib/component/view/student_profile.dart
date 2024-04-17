import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool decider = true;
  late List<bool> _selectedButtons;

  @override
  void initState() {
    super.initState();
    _selectedButtons = List<bool>.filled(2, false);
    _selectedButtons[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 198, 208, 244),
          child: Padding(
            padding: EdgeInsets.all(width / 20),
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width / 20)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Prakash kumar",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Raleway",
                            fontSize: width / 10,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "CCE",
                          style: TextStyle(
                            fontFamily: "Raleway-SemiBold",
                            fontSize: width / 15,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "II year",
                          style: TextStyle(fontSize: width / 20),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: width / 20)),

                Padding(
                  padding: EdgeInsets.all(width/20),
                  child: ToggleButtons(
                    fillColor : Colors.white,
                    renderBorder: false,
                    // direction: Axis.horizontal,
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < _selectedButtons.length; i++) {
                          _selectedButtons[i] = (i == index);
                        }
                        decider = (index == 0);
                      });
                    },
                    borderRadius: BorderRadius.circular(width / 20),
                    // fillColor: Colors.blue[200],
                    constraints: BoxConstraints(
                      minHeight: width / 10,
                      minWidth: width / 20,
                    ),
                    isSelected: _selectedButtons,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedButtons[0]
                                ? Colors.blue[400]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(5),
                          width: width/3,
                          height: height/10,
                          alignment: Alignment.center,
                          child: const Text(
                            "Performance",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedButtons[1]
                                ? Colors.blue[400]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(5),
                          width: width/3,
                          height: height/10,
                          alignment: Alignment.center,
                          child: const Text(
                            "Personal details",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: width / 20)),

                if (decider)
                  Performance(width, height)
                else
                  Container(width: width, height: height / 5, color: Colors.red,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column Performance(double width, double height) {
    return Column(
      children: [
        
        leetcode(width, height),

        Padding(padding: EdgeInsets.only(top: width / 20)),

        codechef(width, height),

        Padding(padding: EdgeInsets.only(top: width / 20)),

        codeforce(width, height),

        Padding(padding: EdgeInsets.only(top: width / 20)),
      ],
    );
  }

  Widget codeforce(double width, double height) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 20),
          color: Colors.white,
        ),
        width: width,
        height: height / 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

           Container(
            width: width/8,
            height: width/8,
            decoration: const BoxDecoration(
              image:DecorationImage(
                image: AssetImage("assets/image/codeforces.png"),
                fit: BoxFit.fill,
                ),
            ),
           ),   

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("No of problems solved"),
                Text("Rating"),
                Text("Position"),
              ],
            ),

            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("10"),
                Text("10"),
                Text("Newbie"),
              ],
            ),
          ],
        ),
      );
  }

  Widget codechef(double width, double height) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 20),
          color: Colors.white,
        ),
        width: width,
        height: height / 5,
        child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

           Container(
            width: width/8,
            height: width/8,
            decoration: const BoxDecoration(
              image:DecorationImage(
                image: AssetImage("assets/image/icons8-codechef-50.png"),
                fit: BoxFit.fill,
                ),
            ),
           ),   

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("No of problems solved"),
                Text("Rating"),
                Text("Star"),
              ],
            ),

            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("10"),
                Text("10"),
                Text("3*"),
              ],
            ),
          ],
        ),
      );
  }

  Widget leetcode(double width, double height) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 20),
          color: Colors.white,
        ),
        width: width,
        height: height / 4.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

           Container(
            width: width/8,
            height: width/8,
            decoration: const BoxDecoration(
              image:DecorationImage(
                image: AssetImage("assets/image/leetcode.png"),
                fit: BoxFit.fill,
                ),
            ),
           ),   

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("Easy"),
                Text("Medium"),
                Text("Hard"),
              ],
            ),

            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("10"),
                Text("10"),
                Text("10"),
              ],
            ),

            SizedBox(
              width: width/5,
              height: width/5,
              child: const CircularProgressIndicator(
                value: 1,
              ),
            ),
          ],
        ),
      );
  }
}