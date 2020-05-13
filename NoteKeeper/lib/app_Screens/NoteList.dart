import 'package:NoteKeeper/app_Screens/NoteDetail.dart';
import 'package:flutter/material.dart';
class  NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return NoteList_state();
  }

}

class NoteList_state extends State<NoteList>{
  int count=0;
  @override
  Widget build(BuildContext context) {
    
  return Scaffold(
    appBar: AppBar(
      title: Text('Notes'),
    ),
    body: getNoteListview(),
    floatingActionButton: FloatingActionButton(
      tooltip: 'Add Notes',
      child: Icon(Icons.add),
      onPressed: (){
       navigateTodetail('Add Note');
print('FAB created');

    }),
  );
  }

  Widget getNoteListview (){
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context,position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            onTap: (){
              navigateTodetail('Edit Note');
              print('Debug Print');
            },
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(
                Icons.keyboard_arrow_right
              )
            
            ),
            title: Text('Dummy title'),
            subtitle:Text('Dummy Date'),
            trailing: Icon(Icons.delete,color:Colors.grey)
          ),
        );
      },);
  }

  void navigateTodetail(String title){
 Navigator.push(context, MaterialPageRoute(builder: (context){
          return Notedetail(title);
        }));
  }

}