import 'dart:io';
import 'package:paradise/outils/dice.dart';

class DicePool {
  // init de la liste de résultats, de dés, de leur moyenne ainsi que du nombre de face
  int _nbDice = 1;
  int _nbFace = 6;
  
  List<Dice> _listDice = [Dice(6)];
  List<int> _result = [];
  List<String> _listMoyennes = [];
  
  DicePool();

  // initialise le nombre par la valeur attribué
  void setNbDice(int value) {
    this._nbDice = value;
    generateList();
  }

  void setNbFace(int value) {
    this._nbFace = value;
    generateList();
  }

  int getNbDice() {
    return this._nbDice;
  }

  int getNbFace() {
    return this._nbFace;
  }

  List<int> getResult() {
    return this._result;
  }

  List<String> getListMoyennes() {
    return this._listMoyennes;
  }

  List<Dice> getListDice() {
    return this._listDice;
  }

  // ajoute au nombre de dé la valeur (value) qui lui seras attribué
  void incrementNbDice(int value) {
    _nbDice = _nbDice + value;
    generateList();
  }

  // enlève au nombre de dé la valeur (value) qui lui seras attribué
  void decrementNbDice(int value) {
    _nbDice = _nbDice - value > 0 ? _nbDice - value : 1;
    generateList();
  }

  // ajoute au nombre de face la valeur (value) qui lui seras attribué
  void incrementNbFace(int value) {
    _nbFace = _nbFace + value;
    generateList();
  }

  // enlève au nombre de face la valeur (value) qui lui seras attribué
  void decrementNbFace(int value) {
    _nbFace = _nbFace - value > 6 ? _nbFace - value : 6;
    generateList();
  }

  // si la liste de dé n'est pas vide -> éxécute la fonction
  // de lancer de dés pour tout les dés dans la liste de dés
  void lancerPool() {
    this._result.clear();
    if (this._listDice.isNotEmpty) {
      for (Dice dice in this._listDice) {
        dice.lanceDe();
        this._result.add(dice.getResult());
      }
    }
  }

  // génération de la liste de dés
  void generateList() {
    this._listDice.clear();
    for (int i = 0; i < this._nbDice; i++) {
      _listDice.add(Dice(this._nbFace));
    }
    print(this._listDice);
  }

  // init un resultat à 0 qui sera additionner au(x) résultat(s) du lancer
  // retourne le calcul de la moyenne du lancement du dé
  double calculMoyenne() {
    int resultat = 0;
    for (int i = 0; i < this._result.length; i++) {
      resultat = resultat + this._result[i];
    }
    return double.parse((resultat / this._result.length).toStringAsFixed(2));
  }
}
