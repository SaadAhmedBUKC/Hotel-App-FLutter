import 'package:flutter/material.dart';
const KTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.white70),
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);