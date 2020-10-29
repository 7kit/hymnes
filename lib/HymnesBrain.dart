import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HymnesBrain extends ChangeNotifier {

  List<String> favoris;
  
  List<Hymne> _hymnesBank = [
  Hymne(number: 1, soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Vous qui sur la terre 1 !', chant: '\t 1 \n Vous qui sur la terre habitez,\n Chantez à haute voix, chantez!\n Réjouissez-vous au Seigneur,\n Par un saint hymne à son honneur!\n \t 2 \n N’est-il pas le Dieu souverain \n Qui nous a formés de sa main, \n Nous, le peuple qu’il veut chérir, \n Et le troupeau qu’il veut nourrir?', style: 'Andante'),
  Hymne(number: 2, soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Vous qui sur la terre 2 !', chant: '\t 1 \n Entrez dans son temple aujourd’hui \n Venez vous présenter à lui \n Célébrez son nom glorieux, \n Et l’élevez jusques aux cieux. \n \t 2 \n C’est un Dieu rempli de bonté, \n D’une éternelle vérité, \n Toujours propice à nos souhaits, \n Et sa grâce dure à jamais.', style: 'Andante'),
  Hymne(number: 3, soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Vous qui sur la terre 3 !', chant: '\t 1 \n Entrez dans son temple aujourd’hui \n Venez vous présenter à lui \n Célébrez son nom glorieux, \n Et l’élevez jusques aux cieux. \n \t 2 \n C’est un Dieu rempli de bonté, \n D’une éternelle vérité, \n Toujours propice à nos souhaits, \n Et sa grâce dure à jamais.', style: 'Andante'),
  Hymne(number: 4, soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Vous qui sur la terre 4 !', chant: '\t 1 \n Entrez dans son temple aujourd’hui \n Venez vous présenter à lui \n Célébrez son nom glorieux, \n Et l’élevez jusques aux cieux. \n \t 2 \n C’est un Dieu rempli de bonté, \n D’une éternelle vérité, \n Toujours propice à nos souhaits, \n Et sa grâce dure à jamais.', style: 'Andante'),
];

  UnmodifiableListView<Hymne> get hymnes {
    return UnmodifiableListView(_hymnesBank);
  }


  String getHymneChant(int hymneNumber) {
    return _hymnesBank[hymneNumber].chant;
  }

  String getHymneAuteur(int hymneNumber){
    return "Touck Arsene";
  }

  String getHymneStyle(int hymneNumber){
    return "Andante";
  }

  String getHymneHistoire(int hymneNumber){
    return "here you find all the story";
  }
  String getHymneTitre(int hymneNumber) {
    return _hymnesBank[hymneNumber].titre;
  }

  void setHymneFavoris(int hymneNumber) async {
    _hymnesBank[hymneNumber].isFavoris = !_hymnesBank[hymneNumber].isFavoris;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final myStringList = prefs.getStringList('favoris') ?? [];
    if(_hymnesBank[hymneNumber].isFavoris == true){
      myStringList.add(hymneNumber.toString());
    }
    else {
      myStringList.remove(hymneNumber.toString());
    }
    print(myStringList);
    prefs.setStringList('favoris', myStringList);
  }

  String getHymneAudio(int hymneNumber, String audio){
    switch(audio){
      case 'soprano':
        return _hymnesBank[hymneNumber].soprano;
        break;
      case 'alto' :
        return _hymnesBank[hymneNumber].alto;
        break;
      case 'tenor' :
        return _hymnesBank[hymneNumber].tenor;
        break;
      case 'basse' :
        return _hymnesBank[hymneNumber].basse;
        break;
      default : return _hymnesBank[hymneNumber].basse;
    }
  }

  Future<bool> checkFavoris(int num) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final myStringList = prefs.getStringList('favoris') ?? [];
    print('voici la liste $myStringList');
    if(myStringList.contains(num.toString())){
      //print('je suis true pour le $num');
      return true;
    }
    else {
      //print('je suis false pour le $num');
      return false;
    }
  }

  bool getFavoris(int hymneNumber){
    bool result = getHymneFavoris(hymneNumber);
    notifyListeners();
    return result;
  }

  bool getHymneFavoris(int hymneNumber)  {
    bool rep=false;
    checkFavoris(hymneNumber).then((bool result){
      if(result != null){
        rep = result;
         print('je suis $rep pour le $hymneNumber');
      }
      else{
        print('la réponse est NULL');
      }
    });
    print('je suis au $rep 2 pour le $hymneNumber');
    return rep;
  }

  int nombres ()=> _hymnesBank.length;
}

enum Categorie {
  Psaumes,
  DieuLeCreateur,
  DieuAdorationEtLouanges,
  DieuLAmourDeDieu,
  JesusChristSaNaissance,
  JesusChristSonMinistere,
  JesusChristSaMort,
  JesusChristSaResurrectionEtSonAscension,
  JesusChristSonSacerdoce,
  JesusChristSonAmour,
  JesusChristSonRetourEtSonRegne,
  LeSaintEsprit,
  LaParoleDeDieuSaLoi,
  LEgliseCommunionFraternelle,
  LEgliseCulte,
  LEgliseSabbat,
  LEgliseEcoleDuSabbat,
  LEglisePriere,
  LEgliseClotureBenediction,
  LEgliseMissions,
  LEgliseDernierMessage,
  LEgliseBaptemes,
  LEgliseSainteCene,
  EvangelisationAppelAuSalut,
  EvangelisationReponseALAppel,
  VieChretienneRepentanceConversion,
  VieChretienneAmourEtFoi,
  VieChretienneJoieConfiance,
  VieChretienneConsecrationEtSanctification,
  VieChretienneCombatsEtVictoires,
  VieChretienneSecoursEtConsolation,
  EsperanceChretienne,
  ChantsDiversMatin,
  ChantsDiversSoir,
  ChantsDiversNouvelleAnne,
  ChantsDiversMariages,
  ChantsDiversFamille,
  ChantsDiversConsecrationsPasteurs,
  ChantsDiversDedicacesTemples,
  ChantsDiversChantsAdieu,
  ChantsDiversDeuil,
  ChantsDiversTemperance,
  JeunesseAppel,
  JeunesseConsecrationEtAspiration,
  JeunesseVictoireEnChrist,
  JeunesseActiviteMissionnaire,
  JeunesseRecreation,
  Enfants,
  DuosEtChoeurs,
  ChoeursDHommes,
}
enum Auteur {
  Theodore_de_Beze,

}


class Hymne{
  String grandSection1;
  String grandSection2;
  String Auteur;
  String histoire;
  int number;
  String titre;
  String chant;
  String basse;
  String soprano;
  String alto;
  String tenor;
  String style;
  bool isFavoris = false;
  Hymne({this.number, this.soprano, this.alto, this.tenor, this.basse, this.titre, this.chant, this.isFavoris = false, this.style});

  void toggleDone() {
    isFavoris = !isFavoris;
  }
}