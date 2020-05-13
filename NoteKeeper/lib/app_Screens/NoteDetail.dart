import 'package:flutter/material.dart';
class Notedetail extends StatefulWidget{
  String appBarTitle;
  Notedetail(this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    return Notedetail_State(this.appBarTitle);
     }

}

class Notedetail_State extends State<Notedetail>{
  String appBarTitle;
  Notedetail_State(this.appBarTitle);
  static var priorities=['High','Low'];
  TextEditingController titlecontroller=TextEditingController();
  TextEditingController descriptioncontroller=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(appBarTitle), 
  ),
  body: Padding(
    padding: const EdgeInsets.only(top:15.0,bottom: 10.0,right: 8.0,left: 8.0),
    child: ListView(
      children: <Widget>[
        ListTile(
          title: DropdownButton(items: priorities.map((String dropDownStringItem){
            return DropdownMenuItem<String>(value: dropDownStringItem,
            child: Text(dropDownStringItem),);
          }).toList(),value: 'Low',
           onChanged: (valueselectedbyuser){
             setState(() {
               print(valueselectedbyuser);
             });
           }),
        ),
        Padding(
          padding: const EdgeInsets.only(top:15.0,bottom: 15.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.5)
            ),),
            controller:titlecontroller,
            onChanged: (value){
              print('Textfield 1');
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top:15.0,bottom: 15.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.5)
            ),),
            controller:descriptioncontroller,
            onChanged: (value){
              print('Textfield 2');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:15.0,bottom:15.0),
          child: Row(
            children: <Widget>[
              Expanded(child: RaisedButton(onPressed: (){
                setState(() {
                  print('Save');
                });
              },
              color: Colors.deepPurple,
              child: Text('Save',textScaleFactor: 1.5,
              style: TextStyle(color:Colors.white),),
              )),
              Container(
                width: 5.0,
              ),

              Expanded(child: RaisedButton(onPressed: (){
                setState(() {
                  print('Delete');
                });
              },
              color: Colors.deepPurple,
              child: Text('Delete',textScaleFactor: 1.5,
              style: TextStyle(color:Colors.white),),
              ))
            ],
          ),
        )

      ],
    ),
  ),
       );
     }

}