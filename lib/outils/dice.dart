import 'dart:math';

class Dice{
  int _nbFace = 0;
  int ? _res;

  Dice(this._nbFace, this._res);

  int getRes(){
    return _nbFace;
  }

  void lancer(){
    _res = Random().nextInt(_nbFace) + 1;
  }

}