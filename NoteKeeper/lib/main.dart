import 'package:NoteKeeper/app_Screens/NoteDetail.dart';
import 'package:NoteKeeper/app_Screens/NoteList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Note Keeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
        
      ),
      home: NoteList()
    );

  }
  
  
}