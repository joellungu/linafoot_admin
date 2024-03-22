import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/pages/stade/stade_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/liste_arbitre.dart';
import 'package:linafoot_admin/utils/liste_commissaire.dart';
import 'package:linafoot_admin/utils/liste_equipes.dart';
import 'package:linafoot_admin/utils/recherche.dart';

import 'match_controller.dart';

class DetailsMatch extends StatelessWidget {
  //
  Map match;
  ////
  // RxInt nombreDePlacesPourtour = 0.obs;
  // RxInt nombreDePlacesTribuneLateralle = 0.obs;
  // RxInt nombreDePlacesTribuneHonneur = 0.obs;
  // RxInt nombreDePlacesTribuneCentrale = 0.obs;
  // //
  // RxDouble prixPourtour = 0.0.obs;
  // RxDouble prixTribuneLateralle = 0.0.obs;
  // RxDouble prixTribuneHonneur = 0.0.obs;
  // RxDouble prixTribuneCentrale = 0.0.obs;
  //____________________________________________

  StadeController stadeController = Get.find();

  //
  String nomStade = "";
  //
  TextEditingController place = TextEditingController();
  //
  //TextEditingController place = TextEditingController();
  //
  TextEditingController nombreDePlacesPourtour = TextEditingController();
  TextEditingController nombreDePlacesTribuneLateralle =
      TextEditingController();
  TextEditingController nombreDePlacesTribuneHonneur = TextEditingController();
  TextEditingController nombreDePlacesTribuneCentrale = TextEditingController();
  //
  TextEditingController vip = TextEditingController();
  TextEditingController prixVip = TextEditingController();
  TextEditingController prixPourtour = TextEditingController();
  TextEditingController prixTribuneLateralle = TextEditingController();
  TextEditingController prixTribuneHonneur = TextEditingController();
  TextEditingController prixTribuneCentrale = TextEditingController();
  //
  RxString mdpCommissaire = "".obs;
  RxString mdpArbitreCentrale = "".obs;
  RxString mdpOfficier = "".obs;
  //
  DetailsMatch(this.idCalendrier, this.categorie, this.journee, this.match) {
    //
    getInfos();
    //
    date.value = "${match['date']}";
    heure.value = "${match['heure']}";
    //place.value = "";
    //place.text = "${match['nombreDePlaces']}";
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
    matchController.commissaire.value = await matchController
        .getOneCommissaire("${match['commissaire'] ?? ""}");
    //
    matchController.arbitreCentrale.value = await matchController
        .getOneArbitre("${match['arbitreCentrale'] ?? ""}");
    matchController.arbitreAssitant1.value = await matchController
        .getOneArbitre("${match['arbitreAssitant1'] ?? ""}");
    matchController.arbitreAssitant2.value = await matchController
        .getOneArbitre("${match['arbitreAssitant2'] ?? ""}");
    matchController.arbitreProtocolaire.value = await matchController
        .getOneArbitre("${match['arbitreProtocolaire'] ?? ""}");
    //
    nombreDePlacesPourtour.text = "${match['nombreDePlacesPourtour']}";
    nombreDePlacesTribuneLateralle.text =
        "${match['nombreDePlacesTribuneLateralle']}";
    nombreDePlacesTribuneHonneur.text =
        "${match['nombreDePlacesTribuneHonneur']}";
    nombreDePlacesTribuneCentrale.text =
        "${match['nombreDePlacesTribuneCentrale']}";
    //
    prixPourtour.text = "${match['prixPourtour']}";
    prixTribuneLateralle.text = "${match['prixTribuneLateralle']}";
    prixTribuneHonneur.text = "${match['prixTribuneHonneur']}";
    prixTribuneCentrale.text = "${match['prixTribuneCentrale']}";
    vip.text = "${match['vip']}";
    prixVip.text = "${match['prixVIP']}";

    //
    mdpCommissaire.value = match['mdpCommissaire'] ?? "";
    mdpArbitreCentrale.value = match['mdpArbitreCentrale'] ?? "";
    mdpOfficier.value = match['mdpOfficier'] ?? "";
    //
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
  RxInt stade = 0.obs;
  //
  //TextEditingController place = TextEditingController();
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
                child: FutureBuilder(
                  future: stadeController.getAllStades2(),
                  builder: (context, t) {
                    //controller.getAllStades();

                    if (t.hasData) {
                      //
                      List stades = t.data as List;
                      //
                      return Obx(
                        () => DropdownButtonHideUnderline(
                          child: DropdownButton(
                            onChanged: (e) {
                              stade.value = e as int;
                              /**
                              public String region;
    public String ville;
    public String nom;
    public int nombrePlacePourtoure;
    public int nombrePlaceTribuneLateralle;
    public int nombrePlaceTribuneDhonneur;
    public int nombrePlaceTribuneCentrale;
    public int vip;
    public int capaciteStade;
                               */
                              nomStade = "${stades[stade.value]['nom']}";
                              place.text =
                                  "${stades[stade.value]['capaciteStade']}";
                              //
                              nombreDePlacesPourtour.text =
                                  "${stades[stade.value]['nombrePlacePourtoure']}";

                              nombreDePlacesTribuneLateralle.text =
                                  "${stades[stade.value]['nombrePlaceTribuneLateralle']}";

                              nombreDePlacesTribuneHonneur.text =
                                  "${stades[stade.value]['nombrePlaceTribuneDhonneur']}";

                              nombreDePlacesTribuneCentrale.text =
                                  "${stades[stade.value]['nombrePlaceTribuneCentrale']}";

                              vip.text = "${stades[stade.value]['vip']}";
                              //
                            },
                            value: stade.value,
                            items: List.generate(stades.length, (index) {
                              //
                              return DropdownMenuItem(
                                value: index,
                                child: Text(stades[index]['nom']),
                              );
                            }),
                          ),
                        ),
                      );
                      //controller.getAllStades();
                    } else if (t.hasError) {
                      return Container();
                    }
                    return Center(
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Text(
              //     "Nombre de place",
              //     style: textStyle,
              //   ),
              // ),
              // SizedBox(
              //   height: 55,
              //   // decoration: BoxDecoration(
              //   //   borderRadius: BorderRadius.circular(10),
              //   //   border: Border.all(
              //   //     color: Colors.grey.shade600,
              //   //   ),
              //   // ),
              //   child: TextField(
              //     // onChanged: (t) {
              //     //   //
              //     //   place.value = t;
              //     // },
              //     controller: place,
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nombre de place Pourtour",
                  style: textStyle,
                ),
              ),
              Container(
                //height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: nombreDePlacesPourtour,

                      // decoration: InputDecoration(
                      //   border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                    ),
                    TextField(
                      controller: prixPourtour,
                      decoration: InputDecoration(labelText: "Prix en Franc"
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nombre de place Tribune Centrale",
                  style: textStyle,
                ),
              ),
              Container(
                //height: 60,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: nombreDePlacesTribuneCentrale,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          ),
                    ),
                    TextField(
                      controller: prixTribuneCentrale,
                      decoration: InputDecoration(labelText: "Prix en Franc"
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nombre de place Tribune d'honneur",
                  style: textStyle,
                ),
              ),
              Container(
                //height: 60,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: nombreDePlacesTribuneHonneur,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          ),
                    ),
                    TextField(
                      controller: prixTribuneHonneur,
                      decoration: InputDecoration(labelText: "Prix en Franc"
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Nombre de place Tribune Lateralle",
                  style: textStyle,
                ),
              ),
              Container(
                //height: 60,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: nombreDePlacesTribuneLateralle,
                      decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          ),
                    ),
                    TextField(
                      controller: prixTribuneLateralle,
                      decoration: InputDecoration(labelText: "Prix en Franc"
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "VIP",
                  style: textStyle,
                ),
              ),
              Container(
                //height: 60,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: vip,
                      decoration: const InputDecoration(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          ),
                    ),
                    TextField(
                      controller: prixVip,
                      decoration:
                          const InputDecoration(labelText: "Prix en Franc"
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                              ),
                    ),
                  ],
                ),
              ),

              //________________________________________________________________

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
                child: Obx(
                  () => Text(
                    "Commissaire ${mdpCommissaire.value}",
                    style: textStyle,
                  ),
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
                                icon: const Icon(
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
                child: Obx(
                  () => Text(
                    "Arbitre centrale ${mdpArbitreCentrale.value}",
                    style: textStyle,
                  ),
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
                child: Obx(
                  () => Text(
                    "Arbitre protocolaire ${mdpOfficier.value}",
                    style: textStyle,
                  ),
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
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  //
                  Loader.loading();
                  /**
                   *
                   public Long idCalendrier;
    public Long idEquipeA;
    public Long idEquipeB;
    public String stade;
    public boolean terrainNeutre;
    public Long quiRecoit;
    public String saison;
    public String categorie;
    public int journee;
    public String date;
    public String heure;
    public Long commissaire;
    public Long arbitreCentrale;
    public Long arbitreAssitant1;
    public Long arbitreAssitant2;
    public Long arbitreProtocolaire;
    public int nombreDePlaces;
                   */
                  //
                  Map e = {
                    "id": "${match['id']}",
                    "idCalendrier": idCalendrier,
                    "idEquipeA": matchController.equipeA['id'],
                    "nomEquipeA": matchController.equipeA['nom'],
                    "idEquipeB": matchController.equipeB['id'],
                    "nomEquipeB": matchController.equipeB['nom'],
                    //"stade": stades[stade.value]['nom'],
                    "stade": nomStade,
                    "terrainNeutre": "",
                    "quiRecoit": "",
                    "saison": "",
                    "categorie": categorie,
                    "journee": journee,
                    "date": date.value,
                    "heure": heure.value,
                    "commissaire": matchController.commissaire['id'],
                    "mdpCommissaire": mdpGenerer(),
                    "arbitreCentrale": matchController.arbitreCentrale['id'],
                    "mdpArbitreCentrale": mdpGenerer(),
                    "arbitreAssitant1": matchController.arbitreAssitant1['id'],
                    "arbitreAssitant2": matchController.arbitreAssitant2['id'],
                    //""
                    "arbitreProtocolaire":
                        matchController.arbitreProtocolaire['id'],
                    "mdpOfficier": mdpGenerer(),
                    //"nombreDePlaces": place.value,
                    "nombreDePlacesPourtour": nombreDePlacesPourtour.text,
                    "nombreDePlacesTribuneCentrale":
                        nombreDePlacesTribuneCentrale.text,
                    "nombreDePlacesTribuneHonneur":
                        nombreDePlacesTribuneHonneur.text,
                    "nombreDePlacesTribuneLateralle":
                        nombreDePlacesTribuneLateralle.text,
                    "vip": vip.text,
                    "prixVIP": prixVip.text,
                    //
                    "prixPourtour": prixPourtour.text,
                    "prixTribuneCentrale": prixTribuneCentrale.text,
                    "prixTribuneHonneur": prixTribuneHonneur.text,
                    "prixTribuneLateralle": prixTribuneLateralle.text,
                    //
                  };
                  //
                  //print("prixVIP: ${prixVip.text}");
                  matchController.updateMatch(e);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.maxFinite,
                  child: const Text("Modifier"),
                ),
              ),
              const SizedBox(
                height: 10,
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
  //
  String mdpGenerer() {
    //
    var r = Random();
    //
    String mdp = "";
    for (int t = 0; t < 15; t++) {
      mdp = "$mdp${r.nextInt(10)}";
    }
    return mdp;
  }
}
