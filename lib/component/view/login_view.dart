import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SingingCharacter { student, teacher, admin }

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  SingingCharacter? _character = SingingCharacter.student;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:[ Color(0xFF031149),Color.fromARGB(255, 68, 79, 123)]
          )
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: width/2)),
            Container(
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(width/10),
                  topLeft: Radius.circular(width/10)
                ),
              ),
              width: width,
              height: height - width/2,
              child: Padding(
                padding: EdgeInsets.all(width/20),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: width/20)),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: width/16,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                    Padding(padding: EdgeInsets.only(top: width/15)),

                    Container(
                      width: width-2*width/20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width/40),
                      ),
                      child: TextField(
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          label: const Text("username"),
                          suffixIcon: const Icon(Icons.person_2_outlined),
                          labelStyle: TextStyle(
                            color:  const Color(0xFF031149),
                            fontSize: width/20,
                            fontFamily: "Raleway-SemiBold",
                          )
                          // border: InputBorder.none
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(top: width/15)),

                    Container(
                      width: width-2*width/20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width/40),
                      ),
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          label: const Text("password"),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Raleway-SemiBold",
                            color:  const Color(0xFF031149),
                            fontSize: width/20,
                          ),
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          // border: InputBorder.none
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.only(top: width/10)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<SingingCharacter>(
                          value: SingingCharacter.student,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        const Text('Student'),
                        Radio<SingingCharacter>(
                          value: SingingCharacter.teacher,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        const Text('Teacher'),
                        Radio<SingingCharacter>(
                          value: SingingCharacter.admin,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        const Text('Admin'),
                      ],
                    ),

                    Padding(padding: EdgeInsets.only(top: width/20)),

                    SizedBox(
                      width: width-2*width/20,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:const Color.fromARGB(255, 24, 40, 103),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Raleway-SemiBold",
                            fontSize: width/20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
