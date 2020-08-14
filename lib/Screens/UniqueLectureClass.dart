import 'package:flutter/material.dart';
import 'package:hymnes/HymnesBrain.dart';
import 'package:provider/provider.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:backdrop/backdrop.dart';

class UniqueLectureClass extends StatefulWidget {
  final int numero;
  UniqueLectureClass({this.numero});
  @override
  _UniqueLectureClassState createState() => _UniqueLectureClassState();
}

class _UniqueLectureClassState extends State<UniqueLectureClass> {
  //HymnesBrain brain = HymnesBrain();
  String voix = 'soprano';
  static AudioPlayer player = new AudioPlayer();
  AudioCache localTo = new AudioCache(fixedPlayer: player);
  String mode;
  bool favoris = false;// = Provider.of<HymnesBrain>(context).getHymneFavoris(widget.numero);
  @override
  initState(){
    print('bhbgvgvg');
    super.initState();
    favere();
    //favoris = false;//(() async { await faver(new HymnesBrain());} )
    new HymnesBrain().checkFavoris(widget.numero).then((bool result){
      if(result != null){
        print('voici avec sera initialise le state $result');
        setState(() {
          favoris = result;
        });
      }
    });
  }
  Future<bool> faver(HymnesBrain brain) async{
    bool rep = await brain.checkFavoris(widget.numero);
    return rep;
  }
  void favere() async{
    HymnesBrain brain = new HymnesBrain();
    bool rep = await brain.checkFavoris(widget.numero);
    setState(() {
      favoris = rep;
    });
    print('voici avec quoi sera initialisé le state $rep');
  }

  DropdownButtonHideUnderline modeur(){
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
      onChanged: (newValue){
        setState(() {
          voix = newValue;
        });
      },
      value: voix,
      items: [DropdownMenuItem(
        child: Text('S'),
      value: 'soprano'),
      DropdownMenuItem(
        child: Text('A'),
        value: 'alto',
      ),
        DropdownMenuItem(
          child: Text('T'),
          value: 'tenor',
        ),
        DropdownMenuItem(
          child: Text('B'),
          value: 'basse',
        ),]
    ),
    );
  }
  @override
  // Widget build(BuildContext context) {
  //   //favoris = Provider.of<HymnesBrain>(context).getHymneFavoris(widget.numero);
  //   return Consumer<HymnesBrain>(
  //       builder: (context, brain, child) {
          
  //     return (Scaffold(
  //         appBar: AppBar(
  //           title: Center(child: Text("Numeros"),), ###
  //           actions: <Widget>[
  //               IconButton(icon: favoris?Icon(Icons.bookmark):Icon(Icons.book),
  //               onPressed:(){
  //               brain.setHymneFavoris(widget.numero);
  //               setState(() async {
  //                 favoris = await brain.checkFavoris(widget.numero);
  //                 /*if(favoris){
  //                   favoris = false;
  //                 } else {
  //                   favoris = true;
  //                 }*/
  //               });
  //               print('voici le favori $favoris');
  //               } ,)
              
  //           ],
  //         ),
  //         body: Container(
  //           child: Center(
  //             child : GestureDetector(
  //               child: Column(
  //                 children: <Widget>[
  //                   SelectableText(brain.getHymneChant(widget.numero)),
  //                   Row( children: <Widget>[
  //                     Expanded(
  //                       child: FlatButton(
  //                         child: Icon(Icons.play_arrow),
  //                         onPressed: () async {
  //                           await localTo.play(brain.getHymneAudio(widget.numero, voix)+'.mp3');
  //                           //print('Playing : '+voix);
  //                           //print('assets/'+brain.getHymneAudio(widget.numero, 'soprano'));
  //                         },
  //                       ),
  //                     ),
  //                     Expanded(
  //                       flex: 1,
  //                       child: FlatButton(
  //                         child: Icon(Icons.pause),
  //                         onPressed: () async {
  //                           await player.pause();
  //                         },
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: FlatButton(
  //                         child: Icon(Icons.stop),
  //                         onPressed: () async {
  //                           await player.stop();
  //                         },
  //                       ),
  //                     ),
  //                     Expanded(
  //                       flex : 1,
  //                       child: modeur(),
  //                     )
  //                   ],)
  //                 ],
  //               ),
  //             onVerticalDragEnd: (DragEndDetails details){
  //                showModalBottomSheet(
  //                   context: context,
  //                   isScrollControlled: true,
  //                   builder: (context) => SingleChildScrollView(
  //                       child:Container(
  //                         //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //                         child: Text("Voici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymneVoici l'histoire de l'hymne"),
  //                       )
  //                   )
  //               );
  //               print('details de ${brain.getHymneFavoris(widget.numero)} sont $details');
  //             },),
  //           ),
  //         ),
  //         )
  //   );});
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backdrop Demo',
      home: BackdropScaffold(
        appBar: BackdropAppBar(
          title: Center(child: Text("Numeros"),),
          actions: <Widget>[
            IconButton(icon: favoris?Icon(Icons.bookmark):Icon(Icons.book),
                onPressed:(){
                //brain.setHymneFavoris(widget.numero);
                // setState(() async {
                //   favoris = await brain.checkFavoris(widget.numero);
                //   /*if(favoris){
                //     favoris = false;
                //   } else {
                //     favoris = true;
                //   }*/
                // });
                print('voici le favori $favoris');
                } ,),
            BackdropToggleButton(
              icon: AnimatedIcons.list_view,
            )
          ],
        ),
        // subHeaderAlwaysActive: false,
        backLayer: Center(
          child: Text("Back Layer"),
        ),
        subHeader: BackdropSubHeader(
          title: Text("Sub Header"),
        ),
        frontLayer: Center(
          child: Text("Front Layer"),
        ),
      ),
    );
  }
}
