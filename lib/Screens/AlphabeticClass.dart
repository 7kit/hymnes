import 'package:flutter/material.dart';

class AlphabeticClass extends StatefulWidget {
  @override
  _AlphabeticClassState createState() => _AlphabeticClassState();
}

class _AlphabeticClassState extends State<AlphabeticClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Numeros"),),
        ),
        body: Container(
          child: Center(
            child : Text("Recherche par Alphabet"),
          ),
        ));
  }
}
