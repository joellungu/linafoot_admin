import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/arbitres/arbitre_controller.dart';
import 'package:linafoot_admin/pages/calendrier/matchs/nouveau_match.dart';
import 'package:linafoot_admin/pages/rapports/rapport_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';
import 'package:intl/intl.dart';

class RapportJournee extends StatelessWidget {
  int jr;
  String idCalendrier, categorie;
  //
  RapportController controller = Get.find();
  //

  RapportJournee(this.idCalendrier, this.categorie, this.jr, {super.key}) {
    print(
        "response jr $idCalendrier: $idCalendrier, categorie: $categorie, jr: $jr, key: $key");
    //controller.getAllMatchsDeLaJournee(idCalendrier, categorie, "$jr");
  }
  //
  @override
  Widget build(BuildContext context) {
    //
    return Center(
      child: Container(
        width: 500,
        child: Scaffold(
          body: ListView(
            children: [
              FutureBuilder(
                future: controller.getAllMatchsDeLaJournee2(
                    idCalendrier, categorie, "$jr"),
                builder: (c, t) {
                  if (t.hasData) {
                    List matchs = t.data as List;
                    return Column(
                      children: List.generate(
                        matchs.length,
                        (index) {
                          Map match = matchs[index];
                          //
                          List ds = match['date'].split("-");
                          //
                          DateTime date = DateTime(int.parse(ds[2]),
                              int.parse(ds[1]), int.parse(ds[0]));
                          //
                          var d = DateFormat.yMMMEd().format(date);
                          //
                          return Card(
                            //color: Colors.white,
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: 150,
                              width: double.maxFinite,
                              child: InkWell(
                                onTap: () {
                                  //
                                  Get.dialog(
                                    Center(
                                      child: Card(
                                        elevation: 1,
                                        child: SizedBox(
                                          height: 200,
                                          width: 300,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  //getRapport
                                                  Get.back();
                                                  Loader.loading();
                                                  //
                                                  controller.getRapport(
                                                      "${match['idCalendrier']}",
                                                      "1",
                                                      1);
                                                },
                                                child:
                                                    Text("Rapport Commissaire"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  //
                                                  Get.back();
                                                  Loader.loading();
                                                  //
                                                  controller.getRapport(
                                                      "${match['idCalendrier']}",
                                                      "2",
                                                      2);
                                                },
                                                child: Text(
                                                    "Rapport arbitre centrale"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  //
                                                  Get.back();
                                                  Loader.loading();
                                                  //
                                                  controller.getRapport(
                                                      "${match['idCalendrier']}",
                                                      "3",
                                                      3);
                                                },
                                                child: const Text(
                                                    "Rapport officier du match"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                //color: Colors.red,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${Requete.url}/equipe/logo/${match['idEquipeA']}"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${match['nomEquipeB']}",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "JOURNEE ${match['journee']}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow.shade700,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "$d ${match['date']}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${match['stade']}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "linafoot",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 5,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow.shade700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                //color: Colors.red,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${Requete.url}/equipe/logo/${match['idEquipeB']}"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${match['nomEquipeB']}", //nomEquipeA
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (t.hasError) {
                    return Container();
                  }
                  return Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     //
              //     Get.to(NouveauMatch(idCalendrier, categorie, jr));
              //     //
              //   },
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: Text("Ajouter un rencontre"),
              //     height: 50,
              //     width: double.maxFinite,
              //   ),
              // ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     //
          //   },
          //   backgroundColor: Colors.green.shade900,
          //   child: const Icon(Icons.add),
          // ),
        ),
      ),
    );
  }
  //
}
