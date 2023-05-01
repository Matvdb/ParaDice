import 'package:flutter/material.dart';
import 'package:paradise/ecran/lancerPersonnalise.dart';
import 'package:paradise/ecran/myhomepage.dart';
import 'package:paradise/ecran/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Para'Dice",
      theme: ThemeData(
        primaryColor: Colors.green,
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
          '/lanceur': (BuildContext context) =>
              const MyHomePage(title: "Para'Dice",),
          '/personnalise': (BuildContext context) =>
            const LancerDesPersonnalise(title: "Para'Dice",),
      }
    );
  }
}
