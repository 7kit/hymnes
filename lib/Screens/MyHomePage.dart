import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context){
              return [
                PopupMenuItem(child: Text('Noter !'),),
                PopupMenuItem(child: Text('Partager'),),
              ];
            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    color: Colors.blue,
                    child: FlatButton(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.width/4,
                          child: Icon(Icons.star,color: Colors.white,)),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/Favoris');
                      },
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: FlatButton(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.width/4,
                          child: Icon(Icons.format_list_numbered, color: Colors.white,)),
                      onPressed: (){
                        Navigator.of(context).pushNamed('/numeric');
                      },
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    color: Colors.blue,
                    child: FlatButton(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.width/4,
                          child: Icon(Icons.sort_by_alpha, color: Colors.white,)),
                      onPressed: (){
                        print('Alphabetical clicked !');
                      },
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: FlatButton(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.width/4,
                          child: Icon(Icons.search, color: Colors.white,)),
                      onPressed: (){
                        print('Search clicked');
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}