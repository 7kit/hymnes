import 'package:flutter/material.dart';
import 'package:hymnes/Screens/FavorisClass.dart';
import 'package:hymnes/Screens/HomeInput.dart';
import 'package:hymnes/Screens/IntroScreen.dart';
import 'package:hymnes/Screens/SearchClass.dart';
import 'package:hymnes/Screens/NumericClass.dart';
import 'package:hymnes/Screens/AlphabeticClass.dart';
import 'package:hymnes/Screens/UniqueOne.dart';
import 'Screens/UniqueLectureClass.dart';
import 'HymnesBrain.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'Screens/Splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ChangeNotifierProvider(
      create: (context) => HymnesBrain(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hymnes & Louanges',
        routes: <String, WidgetBuilder>{
          "/Favoris" : (BuildContext context) => new FavorisClass(),
          "/search" : (BuildContext context) => new SearchClass(),
          "/numeric" : (BuildContext context) => new NumericClass(),
          "/alphabetic" : (BuildContext context) => new AlphabeticClass(),
          "/unique" : (BuildContext context) => new UniqueLectureClass(numero: 1,),
          "/uniqueOne" : (BuildContext context) => new UniqueOne(numero: 1,),
          "/intro" : (BuildContext context) => new IntroScreen(),
          "/home" : (BuildContext context) => new HomeInput(),
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Splash(),
      ),
    );
  }
}






