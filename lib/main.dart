import 'package:flutter/material.dart';
import 'package:universe/component/view/login_view.dart';
import 'package:universe/component/view/staff_dashboard_view.dart';
import 'package:universe/component/view/staff_profile_view.dart';
import 'package:universe/component/view/student_dashboard_view.dart';
import 'package:universe/component/view/student_profile_view.dart';

void main(){
  Widget myApp = MaterialApp(
    initialRoute : "/staffProfile",
    routes: {
      "/login" : (context) =>  const LoginView(),
      "/staffDash" : (context) => const StaffDashboardView(),
      "/studentDash" : (context) => const StudentDashboardView(),
      "/studentProfile" : (context) => const UserProfile(),
      "/staffProfile" : (context) => const StaffProfileView()
    },
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(myApp);
}