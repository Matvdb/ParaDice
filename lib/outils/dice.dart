import 'dart:math';

class Dice{
  // init du nombre de face du dé et de son résultat
  int _nbFace = 6;
  int _result = 0;

  Dice(this._nbFace);

  // récupère un nombre aléatoire dans le _nbFace initialisé en y 
  // ajoutant "+1" car un dé ne tombe jamais sur 0
  void lanceDe(){
    this._result = Random().nextInt(this._nbFace) + 1;
  }

  int getResult(){
    return this._result;
  }

  int getNbFace(){
    return this._nbFace;
  }

}