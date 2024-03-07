import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';

import 'commissaire_controller.dart';
import 'details_commaissaire.dart';
import 'nouveau_commissaire.dart';

class Commissaires extends GetView<CommissaireController> {
  //
  Commissaires() {
    //
    controller.getAllCommissaire();
  }

  //
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
  //
  RxString mot = "".obs;

  @override
  Widget build(BuildContext context) {
    //
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        width: 500,
        child: Scaffold(
          body: controller.obx(
            (state) {
              RxList equipes = RxList(state as List);
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
                    child: Obx(
                      () => ListView(
                        children: List.generate(equipes.length, (index) {
                          //
                          Map commissaire = equipes[index];
                          //
                          if ("${commissaire['nom']}".contains(mot.value)) {
                            //
                            return ListTile(
                              onTap: () {
                                //
                                Get.to(DetailsCommissaire(commissaire));
                                //
                              },
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${Requete.url}/commissaire/photo/${commissaire['id']}"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              title: Text(
                                  "${commissaire['nom']} ${commissaire['postnom']} ${commissaire['prenom']}"),
                              subtitle: Text(
                                  "${commissaire['region']} ${commissaire['categorie']}"),
                            );
                          } else {
                            return Container();
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              );
            },
            onEmpty: Container(),
            onError: (error) {
              return Center(
                child: Text(
                    "Une erreur c'est produite lors du chargement des informations"),
              );
            },
            onLoading: Loader.loadingW(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //
              Get.to(NouveauCommissaire());
              //
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
