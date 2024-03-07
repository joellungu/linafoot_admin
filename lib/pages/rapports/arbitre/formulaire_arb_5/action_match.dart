import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre_controller.dart';

class ActionMatch extends StatelessWidget {
  //
  int equipe;
  //
  ArbitreController2 arbitreController = Get.find();
  //
  TextEditingController numero = TextEditingController();
  //
  TextEditingController minute = TextEditingController();
  //
  TextEditingController note = TextEditingController();
  //
  List etats = [];
  //
  RxInt typeBut = 1.obs;
  //
  RxInt raisonMotif = 1.obs;
  //
  String action;
  ActionMatch(this.action, this.equipe) {
    //

    //
    if ("Avertissements joueurs" == action) {
      etats = [
        "Fautes légères",
        "Comportement anti-sportif",
        "Jeu dangereux",
        "Simulation",
        "Accumulation de fautes",
        "Contestation des décisions de l'arbitre",
        "Retard de jeu",
        "Comportement antisportif envers les adversaires",
        "Non-respect de la distance sur les coups de pied arrêtés",
        "Sortie de terrain sans autorisation",
        "Jeu déloyal",
        "Empêcher une occasion de but",
        "Comportement inapproprié envers les officiels",
        "Retard de reprise du jeu",
        "Infractions répétées",
      ];
    } else if ("Expulsions joueurs" == action) {
      etats = [
        "Foulure grave",
        "Insultes ou comportement violent",
        "Jeu brutal",
        "Main délibérée",
        "Dénigrement de l'arbitre",
        "Deuxième avertissement",
        "Coup de pied de réparation",
        "Comportement antisportif grave",
        "Violence en dehors du terrain",
        "Interruption volontaire du jeu",
        "Insultes racistes ou discriminatoires",
        "Conduite dangereuse",
        "Refus de quitter le terrain",
        "Actes de tricherie",
        "Violation des règles du fair-play",
      ];
    }
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(action),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Equipe",
                  style: textStyle,
                ),
              ),
              Container(
                //height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  children: [
                    // ListTile(
                    //   onTap: () {
                    //     //
                    //     Recherche.affiche(ListEquipe("Equipe"), context);
                    //   },
                    //   title: const Text("Ajouter"),
                    //   trailing: const Icon(Icons.add),
                    // ),
                    Obx(
                      () => equipe == 1
                          ? ListTile(
                              onTap: () {
                                //
                              },
                              leading: SvgPicture.asset(
                                'assets/IcBaselineSportsSoccer.svg',
                                width: 25,
                                height: 25,
                                color: Colors.blue,
                                semanticsLabel: 'GalaPortrait1.svg',
                              ),
                              title:
                                  Text("${arbitreController.equipeA['nom']}"),
                              subtitle: Text(
                                  "${arbitreController.equipeA['province']}"),
                              // trailing: IconButton(
                              //   icon: Icon(
                              //     Icons.delete,
                              //     color: Colors.red,
                              //   ),
                              //   onPressed: () {
                              //     //
                              //     arbitreController.equipe.value = {};
                              //   },
                              // ),
                            )
                          : ListTile(
                              onTap: () {
                                //
                              },
                              leading: SvgPicture.asset(
                                'assets/IcBaselineSportsSoccer.svg',
                                width: 25,
                                height: 25,
                                color: Colors.blue,
                                semanticsLabel: 'GalaPortrait1.svg',
                              ),
                              title:
                                  Text("${arbitreController.equipeB['nom']}"),
                              subtitle: Text(
                                  "${arbitreController.equipeB['province']}"),
                              // trailing: IconButton(
                              //   icon: Icon(
                              //     Icons.delete,
                              //     color: Colors.red,
                              //   ),
                              //   onPressed: () {
                              //     //
                              //     arbitreController.equipe.value = {};
                              //   },
                              // ),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     "Numéro ",
              //     style: textStyle,
              //   ),
              // ),
              // TextField(
              //   controller: numero,
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
              // //
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Joueur",
                  style: textStyle,
                ),
              ),
              Container(
                //height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        //
                        //Recherche.affiche(ListJoueurs(action, equipe), context);
                        //
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.add),
                    ),
                    action == "Avertissements joueurs"
                        ? Obx(
                            () => Column(
                              children: List.generate(
                                arbitreController.avertissementsJoueurs.length,
                                (index) {
                                  Map joueur = arbitreController
                                      .avertissementsJoueurs[index];
                                  //
                                  return ListTile(
                                    onTap: () {
                                      //
                                    },
                                    leading: SvgPicture.asset(
                                      'assets/MakiSoccer11.svg',
                                      width: 25,
                                      height: 25,
                                      color: Colors.blue,
                                      semanticsLabel: 'MakiSoccer11.svg',
                                    ),
                                    title: Text("${joueur['nom']}"),
                                    subtitle: Text("${joueur['numero']}"),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        //
                                        arbitreController.avertissementsJoueurs
                                            .removeAt(index);
                                        //
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : action == "Expulsions joueurs"
                            ? Obx(
                                () => Column(
                                  children: List.generate(
                                    arbitreController.expulssionsJoueurs.length,
                                    (index) {
                                      Map joueur = arbitreController
                                          .expulssionsJoueurs[index];
                                      //
                                      return ListTile(
                                        onTap: () {
                                          //
                                        },
                                        leading: SvgPicture.asset(
                                          'assets/MakiSoccer11.svg',
                                          width: 25,
                                          height: 25,
                                          color: Colors.blue,
                                          semanticsLabel: 'MakiSoccer11.svg',
                                        ),
                                        title: Text("${joueur['nom']}"),
                                        subtitle: Text("${joueur['numero']}"),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            //
                                            arbitreController
                                                .avertissementsJoueurs
                                                .removeAt(index);
                                            //
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Obx(
                                () => Column(
                                  children: List.generate(
                                    arbitreController.butsJoueurs.length,
                                    (index) {
                                      Map joueur =
                                          arbitreController.butsJoueurs[index];
                                      //
                                      return ListTile(
                                        onTap: () {
                                          //
                                        },
                                        leading: SvgPicture.asset(
                                          'assets/MakiSoccer11.svg',
                                          width: 25,
                                          height: 25,
                                          color: Colors.blue,
                                          semanticsLabel: 'MakiSoccer11.svg',
                                        ),
                                        title: Text("${joueur['nom']}"),
                                        subtitle: Text("${joueur['numero']}"),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            //
                                            arbitreController
                                                .avertissementsJoueurs
                                                .removeAt(index);
                                            //
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                  ],
                ),
              ),
              //
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Minute",
                  style: textStyle,
                ),
              ),
              TextField(
                controller: minute,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              //
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Avertissements joueurs" == action
                      ? "Motif"
                      : "Expulsions joueurs" == action
                          ? "Raisons"
                          : "Score",
                  style: textStyle,
                ),
              ),
              "Buts joueurs" != action
                  ? Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade500,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            onChanged: (e) {
                              //
                              //raisonMotif.value = e as int;
                            },
                            value: raisonMotif.value,
                            items: List.generate(
                              etats.length,
                              (index) => DropdownMenuItem(
                                value: index + 1,
                                child: Text("${etats[index]}"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : TextField(
                      controller: note,
                      keyboardType: action == "Buts joueurs"
                          ? TextInputType.number
                          : TextInputType.text,
                      maxLines: action == "Buts joueurs" ? 1 : 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
              //
              const SizedBox(
                height: 10,
              ),
              action == "Buts joueurs"
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Type de but",
                        style: textStyle,
                      ),
                    )
                  : Container(),
              //
              action == "Buts joueurs"
                  ? Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade500,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton(
                            onChanged: (e) {
                              //
                              //typeBut.value = e as int;
                            },
                            value: typeBut.value,
                            items: const [
                              DropdownMenuItem(
                                child: Text("Auto but"),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text("Penalité"),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text("Classique"),
                                value: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              //
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  //
                  Map joueur = "Avertissements joueurs" == action
                      ? arbitreController.avertissementsJoueurs[0]
                      : "Expulsions joueurs" == action
                          ? arbitreController.expulssionsJoueurs[0]
                          : arbitreController.butsJoueurs[0];
                  //
                  Map infos = {
                    "type": action,
                    "equipe": arbitreController.equipe.value,
                    "numero": numero.text,
                    "joueur": joueur,
                    "minute": minute.text,
                    "note": note.text,
                    //"type": ["Auto but", "Penalité", "Classique"][typeBut.value]
                  };
                  //
                  if ("Avertissements joueurs" == action &&
                      "Expulsions joueurs" == action) {
                    infos['note'] = etats[raisonMotif.value];
                  } else {
                    infos['note'] = [
                      "Auto but",
                      "Penalité",
                      "Classique"
                    ][typeBut.value - 1];
                  }
                  if (equipe == 1) {
                    //
                    "Avertissements joueurs" == action
                        ? arbitreController.avertissementsJoueursGeneralA
                            .add(infos)
                        : "Expulsions joueurs" == action
                            ? arbitreController.expulssionsJoueursGeneralA
                                .add(infos)
                            : arbitreController.butsJoueursGeneralA.add(infos);
                  } else {
                    //
                    "Avertissements joueurs" == action
                        ? arbitreController.avertissementsJoueursGeneralB
                            .add(infos)
                        : "Expulsions joueurs" == action
                            ? arbitreController.expulssionsJoueursGeneralB
                                .add(infos)
                            : arbitreController.butsJoueursGeneralB.add(infos);
                  }
                  //
                  arbitreController.equipe.value = {};
                  arbitreController.avertissementsJoueurs.value = [];
                  arbitreController.expulssionsJoueurs.value = [];
                  arbitreController.butsJoueurs.value = [];
                  //
                  Get.back();
                  //
                },
                child: Container(
                  height: 50,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text(
                    "Ajouter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //
            ],
          ),
        ),
      ),
    );
  }

  //
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
