import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paradise/ecran/myhomepage.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key, required this.title});

  final String title;
  
  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer( // Génération d'un Drawer permettant une navigation différente sur l'app
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text("Menu",
                textAlign: TextAlign.center, 
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                ),
              ),
            ),
            ListTile(
              title: const Text('Accès aux statistiques',
                textAlign: TextAlign.center, 
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              onTap: () {
                Navigator.pushNamed(context, '/lanceur');
              },
            ),
            ListTile(
              title: const Text('Accès aux dés personnalisés',
                textAlign: TextAlign.center, 
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              onTap: () {
                Navigator.pushNamed(context, '/personnalise');
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
            child: const Image(image: AssetImage("assets/paradice_logo.png")),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/lanceur');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text("Accès aux statistiques"),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/personnalise');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text("Accès aux dés personnalisés"),
          ),
        ],
      ),
    );
  }
}