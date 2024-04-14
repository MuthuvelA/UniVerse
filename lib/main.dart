
import 'package:flutter/material.dart';
import 'package:universe/component/view/login_view.dart';

void main(){
  Widget myApp = MaterialApp(
    initialRoute: "/login",
    routes: {
      "/login" : (context) =>  LoginView()
    },
  );
  runApp(myApp);
}