import 'package:flutter/material.dart';
import 'package:hotel_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_app/screens/managment_screen.dart';
class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password;
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
                onChanged: (value) {email=value;},
                style: TextStyle(color: Colors.white70),
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
            SizedBox(height: 10),
      TextField(
        textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {password=value;},
                style: TextStyle(color: Colors.white70),
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your password'),
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
                  onPressed: () async {
                    try{final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(newUser!=null){
                      Navigator.pushNamed(context, ManagementScreen.id);
                    }
                    }
                    catch(e){print(e);}
                  }, child: Text('Register', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
