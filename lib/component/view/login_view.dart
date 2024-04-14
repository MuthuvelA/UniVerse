import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40,right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/4.5),
            const Row(
              children: [
                Text(
                  "Login Account",
                  style: TextStyle(fontFamily: "Raleway", fontSize: 20, color: Colors.black),
                ),
                Icon(Icons.person_2_outlined)
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              "Hello, welcome back to our account !",
              style: TextStyle(fontFamily: "Raleway-SemiBold", fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey,width: 1)
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "  Username",
                    hintStyle: TextStyle(fontFamily: "Raleway-SemiBold", fontSize: 17, color: Colors.grey),
                    border: InputBorder.none
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey,width: 1)
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "  Password",
                    hintStyle: TextStyle(fontFamily: "Raleway-SemiBold", fontSize: 17, color: Colors.grey),
                    border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/12),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {},
                minWidth: double.infinity,
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color(0xFF031149),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontFamily: "Raleway-SemiBold", color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
