import 'package:flutter/material.dart';

class PreviewOff extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _PreviewOff();
  }
}

class _PreviewOff extends State<PreviewOff> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            height: 100,
            //color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                              "FEDERATION CONGOLAISE DE FOOTBALL ASSOCIATION"),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("FECOFA"),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("LIGUE NATIONALE DE FOOTBALL"),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Rapport de l'officier du match",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                color: Colors.black,
                width: double.maxFinite,
                padding: const EdgeInsets.all(5),
                height: 30,
                child: Text(
                  "Officier du match",
                  style: style1,
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                width: double.maxFinite,
                padding: const EdgeInsets.all(5),
                height: 30,
                child: Text(
                  "Mokpongbo Lungu Joel",
                  style: style2,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: block("Date", "12-12-2024"),
              ),
              Expanded(
                flex: 2,
                child: block("Heure", "15:30"),
              ),
              Expanded(
                flex: 2,
                child: block("Lieu", "Kinshasa"),
              ),
              Expanded(
                flex: 2,
                child: block("Nombre de spetacteurs", "10000"),
              ),
              Expanded(
                flex: 8,
                child: block("Stade", "Tata Raphael"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: block("Equipe A", "AS VITA CLUB"),
              ),
              Expanded(
                child: block("Equipe B", "Tout Puissant MAZEMBE"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Score à la mi-temps",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: block("AS VITA CLUB", "0"),
              ),
              Expanded(
                child: block("Tout Puissant MAZEMBE", "0"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Score à la fin du match",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: block("AS VITA CLUB", "0"),
              ),
              Expanded(
                child: block("Tout Puissant MAZEMBE", "0"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Les Arbitres",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: block("Arbitre assistant 1", "Kulondu Kiko Paul"),
              ),
              Expanded(
                child: block("Arbitre assistant 2", "Nsimba Nsimba Jean"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: block("Arbitre central", "Kalala Kalala Pierre"),
              ),
              Expanded(
                child: block("", ""),
              ),
            ],
          ),
          //____________
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Remplacements equipe A",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Entrants",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Sortants",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Minutes",
                    style: style1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: List.generate(5, (index) {
                //
                return Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Mokpongbo Lungu Joel",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Mokpongbo Lungu Joel",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "55 min",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          //_______________________
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Remplacements equipe B",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Entrants",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Sortants",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Minutes",
                    style: style1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: List.generate(5, (index) {
                //
                return Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Mokpongbo Lungu Joel",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Mokpongbo Lungu Joel",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "55 min",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          //____________________________________________________________________
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Avertissements joueurs equipe A",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Nom",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Dorssare",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "License",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Minute",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Raison",
                    style: style1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: List.generate(5, (index) {
                //
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Nom",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Dorssare",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "License",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Minute",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Raison",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Expulsions joueurs equipe A",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Nom",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Dorssare",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "License",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Minute",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Raison",
                    style: style1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: List.generate(5, (index) {
                //
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Nom",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Dorssare",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "License",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Minute",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Raison",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Buts joueurs equipe A",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Nom",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Dorssare",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "License",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Minute",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Raison",
                    style: style1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: List.generate(5, (index) {
                //
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Nom",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Dorssare",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "License",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Minute",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Raison",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),

          //____________________________________________________________________
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Avertissements joueurs equipe B",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Nom",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Dorssare",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "License",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Minute",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Raison",
                    style: style1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: List.generate(5, (index) {
                //
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Nom",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Dorssare",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "License",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Minute",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Raison",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Expulsions joueurs equipe B",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Nom",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Dorssare",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "License",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Minute",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Raison",
                    style: style1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: List.generate(5, (index) {
                //
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Nom",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Dorssare",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "License",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Minute",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Raison",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Buts joueurs equipe B",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Nom",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Dorssare",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "License",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Minute",
                    style: style1,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Raison",
                    style: style1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: List.generate(5, (index) {
                //
                return Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Nom",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Dorssare",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "License",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Minute",
                        style: style2,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "Raison",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),

          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  //
  Widget block(String titre, String dada) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          width: double.maxFinite,
          padding: const EdgeInsets.all(5),
          height: 30,
          child: Text(
            titre,
            style: style1,
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          width: double.maxFinite,
          padding: const EdgeInsets.all(5),
          height: 30,
          child: Text(
            dada,
            style: style2,
          ),
        )
      ],
    );
  }

  //
  TextStyle style1 = const TextStyle(
    color: Colors.white,
    fontSize: 13,
  );
  TextStyle style2 = const TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
}
