import 'package:flutter/material.dart';

class PreviewCom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _PreviewCom();
  }
}

class _PreviewCom extends State<PreviewCom> {
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
            color: Colors.red,
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
              "Rapport du commissaire au match",
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
                  "Commissaire au match",
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
                child: block("Arbitre central", "Kulondu Kiko Paul"),
              ),
              Expanded(
                child: block("Arbitre assistant 1", "Nsimba Nsimba Jean"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: block("Arbitre assistant 2", "Kalala Kalala Pierre"),
              ),
              Expanded(
                child: block("Arbitre protocolaire", "Lungu Lungu Joel"),
              ),
            ],
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
                  "Nombre de spectateurs",
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
                  "10000",
                  style: style2,
                ),
              )
            ],
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
                  "Attitude Joueurs équipe A",
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
                  "Nerveux",
                  style: style2,
                ),
              )
            ],
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
                  "Attitude Joueurs équipe B",
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
                  "Tranquille",
                  style: style2,
                ),
              )
            ],
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
                  "Attitude public",
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
                  "Fair play",
                  style: style2,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Etat terrain",
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
                        "Etat terrain",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.black,
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            height: 30,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Etat installation",
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
                        "Etat terrain",
                        style: style2,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          block("Incident",
              """Irure in mollit sit nostrud non do. Non officia tempor proident quis magna reprehenderit ut. Est labore pariatur reprehenderit in cupidatat anim aute voluptate ipsum labore ipsum. Pariatur dolor est esse fugiat ipsum sunt aliqua. Nisi et nostrud incididunt ad in do eu exercitation ut magna laborum veniam culpa aute.

Sunt ea nostrud nulla dolor cupidatat cupidatat incididunt enim dolor do esse. Nostrud velit in ad Lorem incididunt sunt. Culpa velit veniam ullamco incididunt eiusmod non. Labore nulla nulla labore sunt consequat magna esse nisi sit aute labore fugiat ipsum sint. Ad ipsum laborum ut laboris incididunt Lorem ut ullamco tempor non consequat et. Mollit et nostrud occaecat anim adipisicing eiusmod dolore irure esse in anim. Deserunt qui anim aute id deserunt pariatur magna minim qui minim deserunt magna ullamco fugiat."""),
          //
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: block("Organisation générale", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Service de controle", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Service de police", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Service sanitaire", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Organisation", ""),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          block("Personnalité", "Décidé"),
          const SizedBox(
            height: 10,
          ),
          block("Face aux joueurs", "Décidé"),
          block("Cote", "7"),
          block("Commentaire", "Décidé"),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: block("Condition physique", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Cote", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Commentaire", ""),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: block("Capacité quant à l'arbitrage", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Cote", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Commentaire", ""),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: block("Execution de ses obligations", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Cote", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Commentaire", ""),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: block("Discipline et direction", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Cote", ""),
              ),
              Expanded(
                flex: 3,
                child: block("Commentaire", ""),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Evaluation arbitre assistant et reserve",
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
                child: block("Arbitre assistant", "7"),
              ),
              Expanded(
                child: block("Arbitre reserve", "6.5"),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          block("Evaluation du match", "Très facile"),
          const SizedBox(
            height: 10,
          ),
          block("Commentaire", "Bla bla bla bla bla"),

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
