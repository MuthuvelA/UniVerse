import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universe/component/view/admin_dashboard_view.dart';
import 'package:universe/component/view/login_view.dart';
import 'package:universe/component/view/staff_dashboard_view.dart';
import 'package:universe/component/view/staff_profile_view.dart';
import 'package:universe/component/view/student_dashboard_view.dart';
import 'package:universe/component/view/student_profile.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future<void> main() async {
  await dotenv.load(fileName: "/.env");
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/adminDash",
      routes: {
        "/login" : (context) =>  const LoginView(),
        "/staffDash" : (context) => const StaffDashboardView(),
        "/studentDash" : (context) => const StudentDashboardView(post:[]),
        "/studentProfile" : (context) => const UserProfile(),
        "/staffProfile" : (context) => const StaffProfileView(),
        "/adminDash" : (context) => const AdminDashboardView()
      },
    );
  }
}
