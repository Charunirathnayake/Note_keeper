import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:NoteKeeper/Models/Note.dart';

class Databasehelper{
static Databasehelper _databasehelper;
Databasehelper._createinstance();

static Database _database;
String noteTable='note-table';
String colId='id';
String colTitle='title';
String colDescription='description';
String colPriority='priority';
String colDate='date';


factory Databasehelper(){
if(_databasehelper==null){
  _databasehelper=Databasehelper._createinstance();

}
    return _databasehelper;
}

Future<List<Map<String, dynamic>>> getNoteMapList() async {
Database db= await this.database;
var result=await db.query(noteTable,orderBy: '$colPriority ASC');
return result;
}

Future<int> insertNote(Note note) async{
Database db= await this.database;
var result=await db.insert(noteTable, note.toMap());
return result;
}

Future<int> updateNote(Note note) async{
Database db= await this.database;
var result=await db.update(noteTable, note.toMap(),where: '$colId=?',whereArgs: [note.id]);
return result;

}

Future<int> getCount() async{
  Database db= await this.database;
List<Map<String,dynamic>> x=await db.rawQuery('SELECT COUNT (*) from $noteTable ');
int result=Sqflite.firstIntValue(x);
return result;
}


Future<Database> get database async{
  if(_database==null){
    _database=await initializeDatabase();
  }
  return _database;
}

Future<Database>initializeDatabase() async{
  Directory directory=await getApplicationDocumentsDirectory();
  String path=directory.path +'notes.db';

  var notesdatabase= await openDatabase(path,version: 1,onCreate: _createdb);
  return notesdatabase;
}

void _createdb(Database db,int newVersion) async{
await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,' '$colDescription TEXT,$colPriority INTEGER,$colDate TEXT)');
}

}