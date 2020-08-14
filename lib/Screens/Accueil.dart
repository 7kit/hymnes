import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  bool numeric = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text("LOUANGES !")),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text('Paramètres'),),
                PopupMenuItem(child: Text('A Propos'),),
                PopupMenuItem(child: Text('Liens utiles'),),
              ];
            },
          )
        ],
      ),
      body: SafeArea(child: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
            TextField(decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a search term'
            ),
              onChanged: (text){
            },),
            IconButton(icon: numeric?Icon(Icons.format_list_numbered, color: Colors.black,):Icon(Icons.sort_by_alpha, color:Colors.black),onPressed: (){
              setState((){
                numeric = !numeric;
              });
            },)
          ],),),
      )),
    );
  }
}