import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'MyHomePage.dart';
import 'IntroScreen.dart';
import 'Accueil.dart';
import 'IntroScreen.dart';
import 'MyHomePage.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen')?? false);
    //prefs.setStringList('favoris', List<String>());


    if(_seen){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage('Accueil')));
    }
    else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage('Accueil')));
    }
  }

  @override
  void initState(){
    super.initState();
    new Timer(new Duration(milliseconds: 2000), (){
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Container(
      color: Colors.teal[800],
      child: Center(child: Text("Louanges à Dieu !", softWrap:true, textAlign: TextAlign.center, style: TextStyle(color: Colors.white) ),),
    ),);
  }
}
