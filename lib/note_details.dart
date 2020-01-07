import 'package:flutter/material.dart';
import 'dart:async';
import 'package:note_keeper/models/note.dart';
import 'package:note_keeper/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';


class NoteDetail extends StatefulWidget{
  final String appBarTitle;
  final Note note;
  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.note, appBarTitle);
  }

}

class NoteDetailState extends State<NoteDetail>{

  static var _priorities = ["High", "Moderate", "Low"];
  var CurrentSelected = "Low";
  String appBarTitle;
  Note note;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;
    titleController.text = note.title;
    descriptionController.text = note.description;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style: textStyle,
                value: getPriorityAsString(note.priority),
                onChanged: (valueSelected){
                  setState(() {
                    updatePriorityAsInt(valueSelected);
                  });
                },
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  setState(() {
                    updateTitle();
                  });
                },
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Title of your note",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value){
                  updateDescription();
                },
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "write your note here",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("Save", textScaleFactor: 1.5,), onPressed: () {},
                    ),
                  ),

                  Container(width: 5.0,),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text("Delete", textScaleFactor: 1.5,), onPressed: () {},
                    ),
                  )
                ],
              ),
            )




          ],
        ),
      ),
    );
  }
  void updatePriorityAsInt(String value){
    switch (value){
      case 'High': note.priority = 1; break;
      case 'Moderate': note.priority = 2; break;
      case 'Low': note.priority = 3; break;
      default: note.priority = 2; break;
    }
  }

  String getPriorityAsString(int value){
    switch (value){
      case 1: return 'High'; break;
      case 2: return 'Moderate'; break;
      case 3: return 'Low'; break;
      default: return 'Moderate';
    }
  }

  void updateTitle(){
    note.title = titleController.text;
  }
  void updateDescription(){
    note.description = descriptionController.text;
  }



}




















