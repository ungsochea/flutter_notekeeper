import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {

  String appBarTitle;

  NoteDetail(this.appBarTitle);

  @override
  _NoteDetailState createState() => _NoteDetailState(this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {

  static var _priorities = ['Hight','Low'];
  String appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return WillPopScope (
      onWillPop: (){
        moveToLastScreen();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            moveToLastScreen();
          },),
        ),
        body: Padding(
        padding: EdgeInsets.only(top:15.0,left: 10.0,right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                style: textStyle,
                value: 'Low',
                onChanged: (valueSelectedByUser){
                  setState(() {
                    debugPrint('User selected $valueSelectedByUser');
                  });
                },
              ),
            ),
            
            //Second Element
            Padding(
              padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  debugPrint('Someting changed in title text field');
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),

            //Third Element
            Padding(
              padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value){
                  debugPrint('Someting changed in title text field');
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),

            //Fourth Element
            Padding(
              padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
              child: Row(children: <Widget>[

                Expanded(child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  child: Text('Save',textScaleFactor:1.5),
                  onPressed: (){
                    setState(() {
                      debugPrint("Save button clicked!");
                    });
                  },
                ),),

                Container(width: 5.0,),

                Expanded(child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,
                  child: Text('Delete',textScaleFactor:1.5),
                  onPressed: (){
                    setState(() {
                      debugPrint("Deleted button clicked!");
                    });
                  },
                ),),

              ],),
            )


          ],
        ),
      ),
    ));
  }
  void moveToLastScreen(){
    Navigator.pop(context);
  }
}