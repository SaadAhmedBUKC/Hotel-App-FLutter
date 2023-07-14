import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/constants.dart';
import 'package:hotel_app/screens/managment_screen.dart';
class AddScreen extends StatefulWidget {
  static String id = 'add_screen';
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _firestore = Firestore.instance;
  String floorNumber;
  String roomNumber;
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
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {roomNumber=value;},
              style: TextStyle(color: Colors.white70),
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter room number'),
            ),
            SizedBox(height: 10),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {floorNumber=value;},
              style: TextStyle(color: Colors.white70),
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter the floor number of the room'),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Material(
                color: Colors.white70,
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  minWidth: 200,
                  height: 42,
                  onPressed: () {
                    _firestore.collection('rooms').add({
                      'room number': roomNumber,
                      'floor number': floorNumber,
                    });
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        backgroundColor: Colors.white70,
                        content: Text('Room added successfully'),
                        actions: <Widget>[
                          TextButton(onPressed: (){Navigator.pushReplacementNamed(context, ManagementScreen.id);}, child: const Text('OK', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      );
                    });
                    // setState(() {
                    //   AlertDialog(
                    //     backgroundColor: Colors.white70,
                    //     title: Text('Room has been added', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                    //   );
                    //   Navigator.pushReplacementNamed(context, ManagementScreen.id);
                    // });
                  }, child: Text('ADD', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
