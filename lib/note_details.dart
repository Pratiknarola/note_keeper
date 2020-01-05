import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget{
  String appBarTitle;
  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(appBarTitle);
  }

}

class NoteDetailState extends State<NoteDetail>{

  static var _priorities = ["High", "Moderate", "Low"];
  var CurrentSelected = "Low";
  String appBarTitle;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

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
                value: CurrentSelected,
                onChanged: (valueSelected){
                  setState(() {
                    CurrentSelected = valueSelected;
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
}