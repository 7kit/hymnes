import 'package:flutter/material.dart';
import 'package:hymnes/HymnesBrain.dart';
import 'package:hymnes/Screens/UniqueLectureClass.dart';

class FavorisClass extends StatefulWidget {
  @override
  _FavorisClassState createState() => _FavorisClassState();
}

class _FavorisClassState extends State<FavorisClass> {
  HymnesBrain brain = new HymnesBrain();
  @override
  Widget build(BuildContext context) {

    Widget _buildRow(int idx){
      return ListTile(
          leading: CircleAvatar(
            child: Text('$idx'),
          ),
          title: Text("Item $idx",
            style: TextStyle(fontSize: 18.0),
          ),
          trailing: Icon(Icons.dashboard)
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child : Text("Favoris")),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width-20.0,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: Colors.blue[200]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children : <Widget>[
            Expanded(
              child: ListView.builder(itemCount: brain.nombres(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(brain.getHymneTitre(index)),
                subtitle: Text('Auteur'),
                leading: CircleAvatar(child: Text('$index'),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => UniqueLectureClass(numero: index,),
                  ),);
                },) ;
              },),
            ),
          //Text(brain.getHymneTitre(1)),
        ],)
      ),
    );

  }
}