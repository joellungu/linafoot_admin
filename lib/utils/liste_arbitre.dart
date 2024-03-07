import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/arbitres/arbitre_controller.dart';
import 'package:linafoot_admin/pages/calendrier/matchs/match_controller.dart';
import 'package:linafoot_admin/pages/commissaires/commissaire_controller.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';

class ListArbitre extends StatelessWidget {
  //
  MatchController matchController = Get.find();
  ArbitreController arbitreController = Get.find();
  //
  String des;
  ListArbitre(this.des);
  /*
  RxList equipes = [
    {
      "nom": "Tout puissant Mazembe Englebert",
      "province": "Lubumbashi",
      "categorie": ""
    },
    {"nom": "FC Saint-Éloi Lupopo", "province": "Lubumbashi", "categorie": ""},
    {"nom": "FC Lubumbashi sport", "province": "Lubumbashi", "categorie": ""},
    {"nom": "CS Don Bosco", "province": "Lubumbashi", "categorie": ""},
    {
      "nom": "As Maniema Union de Kindu",
      "province": "Maniema",
      "categorie": ""
    },
    {
      "nom": "As Dauphin noir de Goma",
      "province": "Nord Kiva",
      "categorie": ""
    },
    {"nom": "As Vita club", "province": "Kinshasa", "categorie": ""},
    // {
    //   "nom": "Dc Motema Pembe de Kinshasa",
    //   "province": "Kinshasa",
    //   "categorie": ""
    // },
    {"nom": "LES AIGLES DU CONGO", "province": "Kinshasa", "categorie": ""},
    //{"nom": "FC LUBUMBASHI SPORT", "province": "Mbuji-Mayi", "categorie": ""},
  ].obs;
  */
  RxString mot = "".obs;

  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: FutureBuilder(
        future: arbitreController.getAllArbitre2(),
        builder: (c, t) {
          List equipes = t.data ?? [];
          if (t.hasData) {
            return Column(
              children: [
                Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onChanged: (t) {
                      //
                      mot.value = t;
                      //
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: List.generate(
                      equipes.length,
                      (index) {
                        //
                        Map equipe = equipes[index];
                        //
                        if ("${equipe['nom']}".contains(mot.value) ||
                            "${equipe['postnom']}".contains(mot.value) ||
                            "${equipe['prenom']}".contains(mot.value)) {
                          //
                          return ListTile(
                            onTap: () {
                              //
                              if ("A1" == des) {
                                matchController.arbitreCentrale.value = equipe;
                              }
                              //
                              if ("A2" == des) {
                                matchController.arbitreAssitant1.value = equipe;
                              }
                              //
                              if ("A3" == des) {
                                matchController.arbitreAssitant2.value = equipe;
                              }
                              //
                              if ("A4" == des) {
                                matchController.arbitreProtocolaire.value =
                                    equipe;
                              }
                              //

                              //arbitreController.equipeB.value = equipe;

                              //
                              Get.back();
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
                                "${equipe['nom']} ${equipe['postnom']} ${equipe['prenom']}"),
                            subtitle: Text("${equipe['telephone']}"),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                )
              ],
            );
          } else if (t.hasError) {
            return Container();
          }
          return const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
