import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:paradise/ecran/accueil.dart';
import 'package:paradise/ecran/myhomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // Réalise un timer de 2 sec qui redirigeras ensuite sur la page d'accueil
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2), 
      () => Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => const Accueil(title: "Accueil")
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(image: AssetImage("assets/paradice_logo.png")),
          Padding(padding: EdgeInsets.all(30)),
          SpinKitRing(color: Colors.white, size: 40.0, lineWidth: 3,)
        ],
      ),
    );
  }
}