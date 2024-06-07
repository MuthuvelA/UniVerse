import 'package:flutter/material.dart';
import 'package:universe/component/utils/credentials.dart';
import 'package:universe/component/view/staff_dashboard_view.dart';
import 'package:universe/component/view/student_dashboard_view.dart';
import 'package:universe/service/loginService.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? _selectedCharacter;
  final List<String> _characterOptions = ['Student', 'Teacher', 'Admin'];

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF031149), Color.fromARGB(255, 68, 79, 123)],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: width / 2)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(width / 10),
                        topLeft: Radius.circular(width / 10),
                      ),
                    ),
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.all(width / 20),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: width / 20)),
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: width / 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: width / 15)),
                          Container(
                            width: width - 2 * width / 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width / 40),
                            ),
                            child: TextField(
                              controller: _usernameController,
                              textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                label: const Text("username"),
                                suffixIcon: const Icon(Icons.person_outline),
                                labelStyle: TextStyle(
                                  color: const Color(0xFF031149),
                                  fontSize: width / 20,
                                  fontFamily: "Raleway-SemiBold",
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: width / 15)),
                          Container(
                            width: width - 2 * width / 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width / 40),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              textAlign: TextAlign.justify,
                              decoration: InputDecoration(
                                label: const Text("password"),
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Raleway-SemiBold",
                                  color: const Color(0xFF031149),
                                  fontSize: width / 20,
                                ),
                                suffixIcon: const Icon(Icons.remove_red_eye),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: width / 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _characterOptions
                                .map((option) => Row(
                              children: [
                                Radio<String>(
                                  value: option,
                                  groupValue: _selectedCharacter,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedCharacter = value;
                                    });
                                  },
                                ),
                                Text(
                                  option,
                                  style: TextStyle(fontSize: width / 20),
                                ),
                              ],
                            ))
                                .toList(),
                          ),
                          Padding(padding: EdgeInsets.only(top: width / 20)),
                          SizedBox(
                            width: width - 2 * width / 20,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _isLoading = true;
                                  userCredentials.set_pass(_passwordController.text);
                                  userCredentials.set_user(_usernameController.text);
                                  userCredentials.set_user_type(_selectedCharacter ?? '');
                                });
                                setState(() {
                                  _isLoading = false;
                                });

                                if (userCredentials.get_user_type() == "Student") {
                                  Map<dynamic, dynamic> mp = await validateLogin();
                                  if (mp["status"]) {
                                    print("From Login : ${userCredentials.get_user_type()}");
                                    if (userCredentials.get_user_type() == 'Student') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => StudentDashboardView(post: mp['post'])),
                                      );
                                    }
                                  }
                                }
                                if (userCredentials.get_user_type() == 'Teacher') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const StaffDashboardView()),
                                  );
                                }
                                else {
                                  showDialog("Wrong username and password");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 24, 40, 103),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Raleway-SemiBold",
                                  fontSize: width / 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (_isLoading)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
  Widget showDialog(String message) {
    return AlertDialog(
      title: Text(
        "IMPORT INFORMATION",
        style: TextStyle(
            fontFamily: "Raleway",
            fontSize: 18,
            color: Colors.black
        ),
      ),
      content: Text(message),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
