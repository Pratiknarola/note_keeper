import 'package:flutter/material.dart';
import 'package:note_keeper/note_details.dart';

class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }


}

class NoteListState extends State<NoteList> {

  int count = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'),),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("FAB clicked");
          Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return NoteDetail("Add Note");
            }
          ));
        },
        tooltip: "Add note",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
        itemCount: count,
        itemBuilder:(BuildContext context, int position){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text("Sample title", style: titleStyle,),
              subtitle: Text("Sample subtitle"),
              trailing: Icon(Icons.delete, color: Colors.grey,),
              onTap: (){
                debugPrint("Listtile tapped");
                navigateToDetail("Edit Note");
              },


            ),
          );
        });

  }
  void navigateToDetail(String appBarTitle){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetail(appBarTitle);
    }));
  }
}
