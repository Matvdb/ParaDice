import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:paradise/outils/dice.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  late AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

  Container de = Container();
  AssetImage assetImage = const AssetImage("assets/de.png");

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {
        if (_controller.status == AnimationStatus.completed) {
          _controller.repeat(period: Duration(seconds: 2));
          assetImage;
        }
      });
    });
  }

  Widget afficheDe(){
    de = Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: assetImage,
        )
      ),
    );
    return de;
  }

  int _nbFace = 6;
  int ? _res;
  int _nbResult = 0;
  int nbDe = 0;
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

  Widget afficheResultat(){
    if(_res == null){
      _res = 0;
    }
    return Text("$_res", 
      style: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),);
  }

  Widget afficheNbDe(){
    if(nbDe < 0){
      nbDe = 0;
    }
    return Text("$nbDe",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),);
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
  
  Widget _buttons(String operateur, int value){
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
        onPressed: (){
          setState(() {
            nbDe = nbDe + value;
          });
        },
        child: Text("$operateur" + "$value",
          style: const TextStyle(
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
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buttons("", -10),
                const Padding(padding: EdgeInsets.all(5)),
                _buttons("", -1),
                const Padding(padding: EdgeInsets.all(5)),
                _buttons("", 1),
                const Padding(padding: EdgeInsets.all(5)),
                _buttons("+", 1),
                const Padding(padding: EdgeInsets.all(5)),
                _buttons("+", 10),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                const Text(
                  'Nombre de dé : ',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                afficheNbDe(),
              ]
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Résultat du lancement ',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                afficheResultat(),
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.75,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _txtResultat("Nombre de 1 : $nb1"),
                const Padding(padding: EdgeInsets.all(5)),
                _txtResultat("Nombre de 4 : $nb4"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _txtResultat("Nombre de 2 : $nb2"),
                const Padding(padding: EdgeInsets.all(5)),
                _txtResultat("Nombre de 5 : $nb5"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _txtResultat("Nombre de 3 : $nb3"),
                const Padding(padding: EdgeInsets.all(5)),
                _txtResultat("Nombre de 6 : $nb6"),
              ],
            ),
                  ],
                ),
              ),
            ),
            
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Moyenne des lancement : $_nbMoyenne"),
              ],
            ),
            const Padding(padding: EdgeInsets.all(30)),
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 50 * math.pi,
                  child: de,
                );
              },
              child: de,
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lancer();
            recupResult();
            moyenne();
            afficheDe();
          });
        },
        tooltip: 'Lancer dé',
        child: const Icon(Icons.casino),
      ),
    );
  }
}
