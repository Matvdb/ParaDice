import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paradise/outils/dice.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  /* late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  ); */

  /* @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    Duration(seconds: 3);
  } */

  int _nbFace = 6;
  int ? _res;
  int _nbResult = 0;
  int nb1 = 0;
  int nb2 = 0;
  int nb3 = 0;
  int nb4 = 0;
  int nb5 = 0;
  int nb6 = 0;
  double _nbMoyenne = 0;

  int getRes(){
    return _nbFace;
  }

  void lancer(){
    _res = Random().nextInt(_nbFace) + 1;
  }

  void moyenne(){
    setState(() {
      double myn = (nb1 + nb2 + nb3 + nb4 + nb5 + nb6) / _nbFace;
      _nbMoyenne = myn;
    });
  }

  void recupResult(){
    setState(() {
        if(_res != 0){
          if(_res == 1){
            nb1++;
          }
          if(_res == 2){
            nb2++;
          }
          if(_res == 3){
            nb3++;
          }
          if(_res == 4){
            nb4++;
          }
          if(_res == 5){
            nb5++;
          }
          if(_res == 6){
            nb6++;
          }
        }
      }
    );
  }
  
  Widget _buttons(int value){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
        ),
        onPressed: (){},
        child: Text(
          "$value",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _txtResultat(String txt){
    return Text(txt);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buttons(-10),
                Padding(padding: EdgeInsets.all(5)),
                _buttons(-1),
                Padding(padding: EdgeInsets.all(5)),
                _buttons(1),
                Padding(padding: EdgeInsets.all(5)),
                _buttons(1),
                Padding(padding: EdgeInsets.all(5)),
                _buttons(10),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nombre de ',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  '$_res',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Les résultats",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _txtResultat("Nombre de 1 : " + "$nb1"),
                Padding(padding: EdgeInsets.all(5)),
                _txtResultat("Nombre de 4 : " + "$nb4"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _txtResultat("Nombre de 2 : " + "$nb2"),
                Padding(padding: EdgeInsets.all(5)),
                _txtResultat("Nombre de 5 : " + "$nb5"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _txtResultat("Nombre de 3 : " + "$nb3"),
                Padding(padding: EdgeInsets.all(5)),
                _txtResultat("Nombre de 6 : " + "$nb6"),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Résultat obtenu : " + "$_nbMoyenne"),
              ],
            ),
            /* RotationTransition(
              turns: _animation,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FlutterLogo(size: 150.0),
              ),
            ), */
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lancer();
            recupResult();
            moyenne();
          });
        },
        tooltip: 'Lancer dé',
        child: const Icon(Icons.casino),
      ),
    );
  }
}
