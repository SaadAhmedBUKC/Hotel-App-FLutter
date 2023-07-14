import 'package:flutter/material.dart';
import 'package:hotel_app/screens/add_screen.dart';
import 'package:hotel_app/screens/login_screen.dart';
import 'package:hotel_app/screens/managment_screen.dart';
import 'package:hotel_app/screens/register_screen.dart';
import 'package:hotel_app/screens/show_screen.dart';
import 'package:hotel_app/screens/welcome_screen.dart';
import 'package:hotel_app/screens/delete_screen.dart';
void main() {
  runApp(HotelApp());
}
class HotelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ShowScreen.id,
      routes: {
        ShowScreen.id: (context) => ShowScreen(),
        AddScreen.id: (context) => AddScreen(),
        DeleteScreen.id: (context) => DeleteScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ManagementScreen.id: (context) => ManagementScreen(),
      }
    );
  }
}






