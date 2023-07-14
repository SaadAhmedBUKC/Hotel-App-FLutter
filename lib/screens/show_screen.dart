import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/constants.dart';
import 'managment_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class ShowScreen extends StatefulWidget {
  static String id = 'show_screen';
  @override
  _ShowScreenState createState() => _ShowScreenState();
}
FirebaseUser loggedInUser;
class _ShowScreenState extends State<ShowScreen> {
  String rNo;
  bool status=false;
  FirebaseUser user;
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
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
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('rooms').snapshots(),
              builder: (context, snapshot){
                if(!snapshot.hasData) {return Center(child: CircularProgressIndicator(
                  backgroundColor: Colors.white70,
                ));}
                  final rooms = snapshot.data.documents;
                  List<DropdownMenuItem> roomWidgets = [];
                  for(var room in rooms){
                    final rNo = room.data['room number'];
                    final roomWidget = DropdownMenuItem(child: Text('$rNo'), value: rNo);
                    roomWidgets.add(roomWidget);
                  }
                  return Center(
                    child: (DropdownButton(items: roomWidgets,
                    onChanged: (value){},
                      dropdownColor: Colors.tealAccent,
                      iconEnabledColor: Colors.white,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      iconSize: 80,)),
                  );
              },
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {rNo=value;},
              style: TextStyle(color: Colors.white70),
              decoration: KTextFieldDecoration.copyWith(hintText: 'Enter room number'),
            ),
            SizedBox(height: 10),
            SizedBox(height: 24),
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
                    void demo() async {
                      String myDocId = 'user.id';
                      DocumentSnapshot documentSnapshot;
                      await Firestore.instance.collection('booking').document(myDocId).get().then((value) => documentSnapshot=value);
                      rNo = documentSnapshot['room number'];
                      status=true;
                      status = documentSnapshot['status'];
                    }
                    // setState(() {
                    //   status=true;
                    //   _firestore.collection('booking').document(rNo).updateData({'room number': rNo, 'status': status}).then((value) => status);
                    // });

                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        backgroundColor: Colors.white70,
                        content: Text('Room booked successfully'),
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
                  }, child: Text('BOOK', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        ),
        ),
      );
  }
}
