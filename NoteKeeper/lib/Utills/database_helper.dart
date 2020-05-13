import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:NoteKeeper/Models/Note.dart';
class Databasehelper{
static Databasehelper _databasehelper;
Databasehelper()._createInstance();

factory Databasehelper(){

  if(_databasehelper==null){
    _databasehelper=Databasehelper()._createInstance();
  }
  return _databasehelper;
}

}