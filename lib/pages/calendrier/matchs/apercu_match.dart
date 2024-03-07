import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/liste_arbitre.dart';
import 'package:linafoot_admin/utils/liste_commissaire.dart';
import 'package:linafoot_admin/utils/liste_equipes.dart';
import 'package:linafoot_admin/utils/recherche.dart';

import 'match_controller.dart';

class ApercuMatch extends StatelessWidget {
  //
  Map match;
  //
  ApercuMatch(this.idCalendrier, this.categorie, this.journee, this.match) {
    //
    getInfos();
    //
    date.value = "${match['date']}";
    heure.value = "${match['heure']}";
    //place.value = "";
    place.text = "${match['nombreDePlaces']}";
    //date.value = "${match['arbitreCentrale']}";
  }
  //
  getInfos() async {
    //
    matchController.equipeA.value =
        await matchController.getOneEquipe("${match['idEquipeA']}");
    matchController.equipeB.value =
        await matchController.getOneEquipe("${match['idEquipeB']}");
    //
    matchController.commissaire.value =
        await matchController.getOneCommissaire("${match['commissaire']}");
    //
    matchController.arbitreCentrale.value =
        await matchController.getOneArbitre("${match['arbitreCentrale']}");
    matchController.arbitreAssitant1.value =
        await matchController.getOneArbitre("${match['arbitreAssitant1']}");
    matchController.arbitreAssitant2.value =
        await matchController.getOneArbitre("${match['arbitreAssitant2']}");
    matchController.arbitreProtocolaire.value =
        await matchController.getOneArbitre("${match['arbitreProtocolaire']}");
  }

  //
  String idCalendrier;
  int journee;
  String categorie;
  //
  MatchController matchController = Get.find();
  //
  RxList stades = [
    {"nom": "Tata Raphaël", "province": "Kinshasa", "categorie": "A2"},
    {"nom": "Kindu Joseph Kabila", "province": "Kundi", "categorie": "A2"},
    {
      "nom": "Kibasa Maliba (L'shi)",
      "province": "Lubumbashi",
      "categorie": "A3"
    },
    {"nom": "Goma : Stade de L'unité", "province": "Goma", "categorie": "A2"},
    {
      "nom": "L'shi : KAMALONDO (T P Mazembe)",
      "province": "Lubumbashi",
      "categorie": "A1"
    },
  ].obs;
  //
  RxInt stade = 1.obs;
  //
  TextEditingController place = TextEditingController();
  //
  RxInt equipeA = 1.obs;
  RxInt equipeB = 1.obs;
  //
  RxString province = "".obs;
  RxString date = "".obs;
  RxInt equipeBfin = 0.obs;
  //
  RxMap scoreMitemps = {}.obs;
  RxMap scoreFin = {}.obs;
  //
  RxInt division = 1.obs;
  List divisions = ["Première", "Deuxième", "Troisième"];
  //
  RxString heure = "".obs;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details match"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          width: 500,
          child: ListView(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            children: [
              const SizedBox(
                height: 10,
              ),

              //
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Equipe A",
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
                    //     Recherche.affiche(ListEquipe("Equipe A"), context);
                    //   },
                    //   title: const Text("Ajouter"),
                    //   trailing: const Icon(Icons.add),
                    // ),
                    Obx(
                      () => matchController.equipeA['nom'] != null
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
                              title: Text("${matchController.equipeA['nom']}"),
                              subtitle: Text(
                                  "${matchController.equipeA['province']}"),
                            )
                          : Container(),
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
                  "Equipe B",
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
                    //     Recherche.affiche(ListEquipe("Equipe B"), context);
                    //   },
                    //   title: const Text("Ajouter"),
                    //   trailing: const Icon(Icons.add),
                    // ),
                    Obx(
                      () => matchController.equipeB['nom'] != null
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
                              title: Text("${matchController.equipeB['nom']}"),
                              subtitle: Text(
                                  "${matchController.equipeB['province']}"),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
              //

              //
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Stade",
                  style: textStyle,
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton(
                      onChanged: (e) {
                        stade.value = e as int;
                      },
                      value: stade.value,
                      items: List.generate(stades.length, (index) {
                        //
                        return DropdownMenuItem(
                          value: index + 1,
                          child: Text(stades[index]['nom']),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nombre de place",
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 55,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(
                //     color: Colors.grey.shade600,
                //   ),
                // ),
                child: TextField(
                  // onChanged: (t) {
                  //   //
                  //   place.value = t;
                  // },
                  controller: place,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Jour du match (date)",
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
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                lastDate: DateTime(2050),
                                firstDate: DateTime(1900))
                            .then((d) {
                          //
                          if (d != null) {
                            date.value = "${d.day}-${d.month}-${d.year}";
                          }
                        });
                        //Recherche.affiche(ListEquipe("Equipe B"), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.calendar_month),
                    ),
                    Obx(
                      () => date.value.isNotEmpty
                          ? Text(
                              date.value,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          : Container(),
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
                  "Heure",
                  style: textStyle,
                ),
              ),
              //
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
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((d) {
                          //
                          if (d != null) {
                            heure.value = "${d.hour}:${d.minute}";
                          }
                        });
                        //Recherche.affiche(ListEquipe("Equipe B"), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.timelapse),
                    ),
                    Obx(
                      () => heure.value.isNotEmpty
                          ? Text(
                              heure.value,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          : Container(),
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
                  "Commissaire",
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
                        Recherche.affiche(ListCommissaire(), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.add),
                    ),
                    Obx(
                      () => matchController.commissaire['nom'] != null
                          ? ListTile(
                              onTap: () {
                                //
                              },
                              leading: SvgPicture.asset(
                                'assets/GalaPortrait1.svg',
                                width: 25,
                                height: 25,
                                color: Colors.blue,
                                semanticsLabel: 'GalaPortrait1.svg',
                              ),
                              title: Text(
                                  "${matchController.commissaire['nom']} ${matchController.commissaire['postnom']} ${matchController.commissaire['prenom']}"),
                              subtitle: Text(
                                  "${matchController.commissaire['telephone']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  matchController.commissaire.value = {};
                                },
                              ),
                            )
                          : Container(),
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
                  "Arbitre centrale",
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
                        Recherche.affiche(ListArbitre("A1"), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.add),
                    ),
                    Obx(
                      () => matchController.arbitreCentrale['nom'] != null
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
                              title: Text(
                                  "${matchController.arbitreCentrale['nom']} ${matchController.arbitreCentrale['postnom']} ${matchController.arbitreCentrale['prenom']}"),
                              subtitle: Text(
                                  "${matchController.arbitreCentrale['telephone']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  matchController.arbitreCentrale.value = {};
                                },
                              ),
                            )
                          : Container(),
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
                  "Arbitre assistant 1",
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
                        Recherche.affiche(ListArbitre("A2"), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.add),
                    ),
                    Obx(
                      () => matchController.arbitreAssitant1['nom'] != null
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
                              title: Text(
                                  "${matchController.arbitreAssitant1['nom']} ${matchController.arbitreAssitant1['postnom']} ${matchController.arbitreAssitant1['prenom']}"),
                              subtitle: Text(
                                  "${matchController.arbitreAssitant1['telephone']}"),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  matchController.arbitreAssitant1.value = {};
                                },
                              ),
                            )
                          : Container(),
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
                  "Arbitre Assistant 2",
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
                        Recherche.affiche(ListArbitre("A3"), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.add),
                    ),
                    Obx(
                      () => matchController.arbitreAssitant2['nom'] != null
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
                              title: Text(
                                  "${matchController.arbitreAssitant2['nom']} ${matchController.arbitreAssitant2['postnom']} ${matchController.arbitreAssitant2['prenom']}"),
                              subtitle: Text(
                                  "${matchController.arbitreAssitant2['telephone']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  matchController.arbitreAssitant2.value = {};
                                },
                              ),
                            )
                          : Container(),
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
                  "Arbitre protocolaire",
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
                        Recherche.affiche(ListArbitre("A4"), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.add),
                    ),
                    Obx(
                      () => matchController.arbitreProtocolaire['nom'] != null
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
                              title: Text(
                                  "${matchController.arbitreProtocolaire['nom']} ${matchController.arbitreProtocolaire['postnom']} ${matchController.arbitreProtocolaire['prenom']}"),
                              subtitle: Text(
                                  "${matchController.arbitreProtocolaire['telephone']}"),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  //
                                  matchController.arbitreProtocolaire.value =
                                      {};
                                },
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
              //
              //
              //
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
  //
}
