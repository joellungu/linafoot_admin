import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:linafoot_admin/pages/agents/agents_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';

import 'agent_billets_vendu.dart';

class AgentJournee extends GetView {
  //
  String idAgent;
  //
  String? idCalendrier;
  AgentJournee(this.idCalendrier, this.idAgent);
  //
  AgentsController agentsController = Get.find();
  //
  var box = GetStorage();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Loader.backgroundColor,
          appBar: AppBar(
            title: const Text("Matchs"),
            centerTitle: true,
            backgroundColor: Loader.backgroundColor,
          ),
          body: FutureBuilder(
            future: agentsController.getAllJourneeDeLaSaison2(idCalendrier!),
            builder: (c, t) {
              //
              if (t.hasData) {
                List matchs = t.data as List;
                List tris = triJournee(matchs);
                RxString mot = "".obs;
                return Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 55,
                        alignment: Alignment.center,
                        child: TextField(
                          onChanged: (t) {
                            mot.value = t;
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
                          padding: EdgeInsets.all(10),
                          children: List.generate(
                            matchs.length,
                            (index) {
                              //
                              //
                              Map match = matchs[index];

                              //
                              List ds = match['date'].split("-");
                              //
                              DateTime date = DateTime(int.parse(ds[2]),
                                  int.parse(ds[1]), int.parse(ds[0]));
                              //
                              var d = DateFormat.yMMMEd().format(date);
                              if ("${match['nomEquipeA']}"
                                      .contains(mot.value) ||
                                  "${match['nomEquipeB']}"
                                      .contains(mot.value)) {
                                //
                                return Card(
                                  //color: Colors.white,
                                  color: Colors.black,
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    height: 120,
                                    width: double.maxFinite,
                                    child: InkWell(
                                      onTap: () {
                                        //
                                        Get.to(
                                          AgentBilletVendu(
                                              "${match['id']}", idAgent),
                                        );
                                        //
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
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      //color: Colors.red,
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${Requete.url}/equipe/logo/${match['idEquipeA']}"),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "${match['nomEquipeA']}",
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "JOURNEE ${match['journee']}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors
                                                            .grey.shade400),
                                                    child: Column(children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "$d ${match['heure']}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .grey.shade700,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "${match['stade']}",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "linafoot",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 5,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  )
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
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      //color: Colors.red,
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${Requete.url}/equipe/logo/${match['idEquipeB']}"),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
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
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (t.hasError) {
                return Container();
              }
              return Center(
                child: Container(
                  height: 40,
                  width: 40,
                  child: const CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List triJournee(List tab) {
    for (int i = 0; i < tab.length - 1; i++) {
      int index = i;
      for (int j = i + 1; j < tab.length; j++) {
        if (tab[j]['journee'] < tab[index]['journee']) {
          index = j;
        }
      }

      Map min = tab[index];
      tab[index] = tab[i];
      tab[i] = min;
    }
    return tab;
  }
}
