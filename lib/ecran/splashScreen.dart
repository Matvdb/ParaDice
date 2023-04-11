import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paradise/ecran/myhomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2), 
      () => Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => MyHomePage(title: "Para'Dice")
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
        gradient: LinearGradient(
          colors: [
            Colors.green.shade500,
              Theme.of(context).primaryColor,
          ],
        ),
      ),
      child: Center(
        child: Text("Para'Dice",
          style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          decoration: TextDecoration.none
          ),
        ),
      ),
    );
  }
}