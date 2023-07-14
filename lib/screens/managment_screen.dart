import 'package:flutter/material.dart';
import 'package:hotel_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_app/screens/add_screen.dart';
import 'package:hotel_app/screens/delete_screen.dart';
import 'package:hotel_app/screens/show_screen.dart';
class ManagementScreen extends StatefulWidget {
  static String id = 'management_screen';
  @override
  _ManagementScreenState createState() => _ManagementScreenState();
}
FirebaseUser loggedInUser;
class _ManagementScreenState extends State<ManagementScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    try{
      final user = await _auth.currentUser();
      if(user!=null){
        loggedInUser=user;
        print(loggedInUser);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/hotel1.jfif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Material(
                color: Colors.white70,
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  minWidth: 200,
                  height: 42,
                  onPressed: (){Navigator.pushNamed(context, AddScreen.id);},
                  child: Text('Add Rooms', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Material(
                color: Colors.white70,
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  minWidth: 200,
                  height: 42,
                  onPressed: (){Navigator.pushNamed(context, DeleteScreen.id);},
                  child: Text('Delete Rooms', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Material(
                color: Colors.white70,
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  minWidth: 200,
                  height: 42,
                  onPressed: (){Navigator.pushNamed(context, ShowScreen.id);},
                  child: Text('Show Rooms', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
