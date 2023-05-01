import 'package:flutter/material.dart';
import 'package:paradise/outils/dicepool.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  // Initialise un _controller qui executera une animation
  late AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

  // Container ainsi que l'image du dé qui sera 'animé'
  Container de = Container();
  AssetImage assetImage = const AssetImage("assets/de.png");
  
  // Récupération des fonctions etc .. présente dans la classe DicePool
  DicePool _dicePool = new DicePool();
  Column _column = Column();

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
        }
      });
    });
  }

  @override
  void dispose(){
    _controller.dispose(); // Met fin au _controller afin de ne pas faire planter le programme.
    super.dispose();
  }

  // Widget affichant le dé, éxécuté lors du lancer
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

  // Liste de Widgets (boutons) concernant le nombre de dés
  // Leurs utilisations influeras sur le lancer du nombre de dés
  List<Widget> listBtnDes() {
    return [
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.decrementNbDice(10)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('-10', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.decrementNbDice(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('-1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.setNbDice(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.incrementNbDice(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('+1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.incrementNbDice(10)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('+10', style: TextStyle(color: Colors.green)),
      )
    ];
  }

  // Liste de Widgets (boutons) concernant le nombre de faces
  // Leurs utilisations influeras sur le nombre de faces du dé
  List<Widget> listBtnFace() {
    return [
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.decrementNbFace(10)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('-10', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.decrementNbFace(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('-1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.setNbFace(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.incrementNbFace(1)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('+1', style: TextStyle(color: Colors.green)),
      ),
      ElevatedButton(
        onPressed: () => setState(() => _dicePool.incrementNbFace(10)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white)),
        child: const Text('+10', style: TextStyle(color: Colors.green)),
      )
    ];
  }

  // Récupère le nombre de face selon le choix utilisateurs afin de les afficher
  // -> si le nombre de la face est égal au résultat du lancer de dé, le compteur de la face du dé est incrémenter.
  void result() {
    List<Widget> list = List.empty(growable: true);
    int nbFace = _dicePool.getListDice()[0].getNbFace();
    for (int face = 1; face <= nbFace; face++) {
      int count = 0;
      for (int i = 0; i < _dicePool.getResult().length; i++) {
        if (face == _dicePool.getResult()[i]) {
          count++;
        }
      }
      list.add( // Ajout des caractéristiques dans la liste de faces
        RichText(
          text: TextSpan(
            text: 'Nombre de ${face}: ',
            style: const TextStyle(color: Colors.black, fontSize: 18),
            children: [
              TextSpan(
                text: count.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ],
          ),
        ),
      );
    }
    // division de la liste de face par deux pour l'afficher en deux compartiments
    int divlist = (list.length / 2).floor();

    // génération de la première et deuxième liste de faces
    List<Widget> firstList = list.sublist(0, divlist);
    List<Widget> secondList = list.sublist(divlist, list.length);

    setState(() {
      _column = Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: firstList,
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
            Column(
              children: secondList,
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(8)),
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'Moyenne obtenue: ',
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  TextSpan(
                    text: _dicePool.calculMoyenne().toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
              ),
              child: const Image(image: AssetImage("assets/paradice_logo.png")),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: listBtnDes(),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            RichText(
              text: TextSpan(
                text: 'Nombre de dé: ',
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  TextSpan(
                      text: _dicePool.getNbDice().toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: listBtnFace(),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            RichText(
              text: TextSpan(
                text: 'Nombre de face: ',
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  TextSpan(
                      text: _dicePool.getNbFace().toString(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Les résultats :",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(8)),
            _column,
            ...List.from(_dicePool.getListMoyennes().reversed).map(
              (moyenne) => ListTile(
                title: Text(
                  'Moyenne de $moyenne',
                  style: const TextStyle(
                      color: Colors.black,),
                ),
              ),
            ),
            de,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dicePool.lancerPool();
          result();
          afficheDe();
        },
        tooltip: 'Lancer dé',
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.casino),
      ),
    );
  }
}
