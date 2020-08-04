import 'package:flutter/material.dart';

class NumericClass extends StatefulWidget {
  @override
  _NumericClassState createState() => _NumericClassState();
}

class _NumericClassState extends State<NumericClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Numeros"),),
      ),
        body: Container(
          child: Center(
            child : Text("Recherche par des numeros"),
          ),
        ));
  }
}
