import 'package:flutter/material.dart';

class LancerDesPersonnalise extends StatefulWidget {
  const LancerDesPersonnalise({super.key, required this.title});

  final String title;

  @override
  State<LancerDesPersonnalise> createState() => _LancerDesPersonnaliseState();
}

class _LancerDesPersonnaliseState extends State<LancerDesPersonnalise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lancé personnalisé"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Image(image: AssetImage("assets/paradice_logo.png")),
          ),
          Text("fuf")
        ],
      ),
    );
  }
}