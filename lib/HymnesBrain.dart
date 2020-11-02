import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HymnesBrain extends ChangeNotifier {

  List<String> favoris;
  
  List<Hymne> _hymnesBank = [
  Hymne(number: '1', soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Vous qui sur la terre !', chant: '\t 1 \n Vous qui sur la terre habitez,\n Chantez à haute voix, chantez!\n Réjouissez-vous au Seigneur,\n Par un saint hymne à son honneur!\n \t 2 \n N’est-il pas le Dieu souverain \n Qui nous a formés de sa main, \n Nous, le peuple qu’il veut chérir, \n Et le troupeau qu’il veut nourrir?\n \t 3 \n Entrez dans son temple aujourd\'hui;\n Venez vous présenter à lui,\n Célébrez son nom glorieux,\n Et l\'élevez jusques aux cieux.\n \t 4 \n C\'est un Dieu rempli de bonté,\n D\'une éternelle vérité,\n Toujours propice à nos souhaits,\n Et sa grâce dure à jamais.\n', style: 'Andante',auteur: 'Touck Arsene'),
  Hymne(number: '2', soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Les cieux, en chaque lieu...', chant: '\t 1 \n Les cieux, en chaque lieu, \n De la gloire de Dieu \n Instruisent les humains. \n Dans leur immensité, \n \t 2 \n Ils prêchent la beauté \n Des oeuvres de ses mains. \n Un jour à l autre jour \n Annonce son amour, \n Raconte sa puissance; \n Et la nuit à la nuit, \n Sans langage et sans bruit, \n Dit sa magnificence.', style: 'Andante',auteur: 'Touck Arsene'),
  Hymne(number: '3', soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Dieu me conduit', chant: '\t 1 \n Dieu me conduit, par sa bonté suprême; \n C est mon berger qui me garde et qui m aime \n Rien ne me manque en ses gras pâturages, \n Et pour l amour de son nom admirable, \n \t 2 \n Il me protège et rend ma paix durable. \n Quand il faudrait marcher dans la nuit sombre, \n Quand de la mort je traverserais l ombre, \n Je n\'en aurais ni terreur, ni détresse', style: 'Andante',auteur: 'Touck Arsene'),
  Hymne(number: '4', soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Comme un cerf altéré brame', chant: '\t 1 \n Comme un cerf altéré brâme \n Après le courant des eaux, \n Ainsi soupire mon âme, \n Seigneur, après tes ruisseaux; \n \t 2 \n Elle a soif du Dieu vivant, \n Et s\'écrie, en le suivant : \n "Mon Dieu, mon Dieu! quand sera-ce \n Que mes yeux verront ta face?"', style: 'Andante',auteur: 'Touck Arsene'),
  Hymne(number: '5', soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Miséricorde et grâce', chant: '\t 1 \n Miséricorde et grâce, ô Dieu des cieux! \n Un grand pécheur implore ta clémence;\n Use en ce jour de ta douceur immense\n Pour abolir mes crimes odieux.\n Daigne, ô Seigneur ! effacer avec soin \n De mon péché la tache si profonde,\n Et fais-moi grâce en ce pressant besoin; \n Sur ta bonté tout mon espoir se fonde. \n \n \t 2 \n Mon coeur, rempli de tristesse et d\'effroi,\n Connaît sa faute et sent qu\'elle est énorme\n Mon crime, hélas ! sous sa plus laide forme,\n Me suit partout et se présente à moi. \n Contre toi seul j\'ai commis ce forfait,\n C\'est à toi seul de punir mon offense;\n Et si tu veux me punir, en effet,\n Tu paraîtras juste dans ta sentence.\n', style: 'Andante',auteur: 'Touck Arsene'),
  Hymne(number: '6', soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Peuples, venez et qu\'on entende...',chant: '\t 1 \n Peuples, venez, et qu\'on entende \n Partout votre hymne solennel! \n Qu\'en cris de joie on se répande, \n Et que l\'on dise à l\'Éternel : \n Combien tu te montres terrible, \n Seigneur, en tout ce que tu fais! \n L\'ennemi longtemps invincible \n S\'abaisse pour avoir la paix. \n \n \t 2 \n Toute la terre est prosternée \n Au pied de ton trône, Seigneur, \n Et de tes bienfaits couronnée \n Elle célèbre ta grandeur. \n Venez, rendez-lui vos hommages, \n Et jugez, d\'un commun accord, \n Si tant de merveilleux ouvrages \n Sont d\'un autre que du Dieu fort. \n', style: 'Andante',auteur: 'Touck Arsene'),
  Hymne(number: '7', soprano: 'H001', alto: 'H002', tenor: 'H003', basse: 'H004', titre: 'Que Dieu se montre seulement', chant: '\t 1 \n Que Dieu se montre seulement, \n Et l\'on verra dans un moment \n Abandonner la place; \n Le camp des ennemis épars, \n Épouvanté de toutes parts, \n Fuira devant sa face. \n On verra tout ce camp s\'enfuir \n Comme l\'on voit s\'évanouir \n Une épaisse fumée. \n Comme la cire fond au feu, \n Ainsi des méchants devant Dieu \n La force est consumée. \n \n \t 2 \n Réjouissez-vous devant lui! \n Il est des orphelins l\'appui, \n Le défenseur, le père; \n Il est des veuves le recours \n Et de son peuple, tous les jours, \n Il entend la prière. \n Ce Dieu puissant, par sa bonté, \n Ramène la prospérité, \n La paix et l\'allégresse; \n Du captif il brise les fers \n Du juste, dans tout l\'univers, \n Son oeil voit la détresse.\n', style: 'Andante',auteur: 'Touck Arsene'),
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

  getHymneNumber(int hymneNumber) {
    return _hymnesBank[hymneNumber].number;
  }
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
  String auteur;
  String histoire;
  String number;
  String titre;
  String chant;
  String basse;
  String soprano;
  String alto;
  String tenor;
  String style;
  bool isFavoris = false;
  Hymne({this.number, this.soprano, this.alto, this.tenor, this.basse, this.titre, this.chant, this.isFavoris = false, this.style, this.auteur});

  void toggleDone() {
    isFavoris = !isFavoris;
  }
}