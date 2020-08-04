import 'package:flutter/material.dart';

class SearchClass extends StatefulWidget {
  @override
  _SearchClassState createState() => _SearchClassState();
}

class _SearchClassState extends State<SearchClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Numeros"),),
        ),
        body: Container(
          child: Center(
            child : Text("Recherche plus complète"),
          ),
        ));
  }
}