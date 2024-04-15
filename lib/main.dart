
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:universe/component/view/login_view.dart';
import 'package:universe/component/view/staff_dashboard_view.dart';

void main(){
  Widget myApp = MaterialApp(
    initialRoute: "/staffDash",
    routes: {
      "/login" : (context) =>  LoginView(),
      "/staffDash" : (context) => StaffDashboardView()
    },
  );
  runApp(myApp);
}