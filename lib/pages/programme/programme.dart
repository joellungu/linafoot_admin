import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'programme_controller.dart';

class Programme extends GetView<ProgrammeController> {
  //AS DAUPHIN NOIR.png
  //AS MANIEMA UNION.png
  //AS VITA CLUB.png
  //CS DON BOSCO.png
  //LOGO VERTICAL HD.png
  //LES AIGLES DU CONGO.png
  //LUBUMBASHI SPORT.png
  //LUPOPO FC.png
  //TP MAZEMBE.png
  List rencontres = [
    [
      ["JOURNEE 1", "", "", "", "", ""],
      //["Jour", "Date ", "Equipe A", "Equipe B", "Stade ", "Heure "],
      [
        "Vendredi",
        "2/23/2024",
        "AS VITA CLUB",
        "FC Saint Eloi Lupopo",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "Samedi",
        "2/24/2024",
        "LES AIGLES DU CONGO",
        "TP MAZEMBE",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "",
        "2/24/2024",
        "AS DAUPHIN NOIR",
        "CS DON BOSCO",
        "Stade de l'unité ",
        "15h30'"
      ],
      [
        "Dimanche",
        "2/25/2024",
        "AS MANIEMA UNION",
        "FC LUBUMBASHI SPORT",
        "Stade Jopeh Kabila ",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 2", "", "", "", "", ""],
      [
        "Vendredi",
        "3/1/2024",
        "FC LUBUMBASHI SPORT",
        "AS VITA CLUB",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "Samedi",
        "3/2/2024",
        "FC Saint Eloi Lupopo",
        "LES AIGLES DU CONGO",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "",
        "3/3/2024",
        "CS DON BOSCO",
        "AS MANIEMA UNION",
        "TP MAZEMBE",
        "15h30'"
      ],
      [
        "Dimanche",
        "3/3/2024",
        "TP MAZEMBE",
        "AS DAUPHIN NOIR",
        "TP MAZEMBE",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 3 ", "", "", "", "", ""],
      [
        "Vendredi",
        "3/8/2024",
        "AS VITA CLUB",
        "TP MAZEMBE",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "Samedi",
        "3/9/2024",
        "LES AIGLES DU CONGO",
        "CS DON BOSCO",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "",
        "3/10/2024",
        "AS MANIEMA UNION",
        "AS DAUPHIN NOIR",
        "Stade Jopeh Kabila ",
        "15h30'"
      ],
      [
        "Dimanche",
        "3/10/2024",
        "FC Saint Eloi Lupopo",
        "FC LUBUMBASHI SPORT",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 4", "", "", "", "", ""],
      [
        "Vendredi",
        "3/15/2024",
        "FC LUBUMBASHI SPORT",
        "TP MAZEMBE",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "Samedi",
        "3/16/2024",
        "CS DON BOSCO",
        "FC Saint Eloi Lupopo",
        "TP MAZEMBE",
        "15h30'"
      ],
      [
        "",
        "3/16/2024",
        "AS DAUPHIN NOIR",
        "LES AIGLES DU CONGO",
        "Stade de l'unité ",
        "15h30'"
      ],
      [
        "Dimanche ",
        "3/17/2024",
        "AS VITA CLUB",
        "AS MANIEMA UNION",
        "Tata Raphael ",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 5", "", "", "", "", ""],
      [
        "Vendredi",
        "3/22/2024",
        "TP MAZEMBE",
        "LES AIGLES DU CONGO",
        "TP MAZEMBE",
        "15h30'"
      ],
      [
        "Samedi",
        "3/23/2024",
        "FC Saint Eloi Lupopo",
        "AS MANIEMA UNION",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "",
        "3/24/2024",
        "AS DAUPHIN NOIR",
        "FC LUBUMBASHI SPORT",
        "Stade de l'unité ",
        "15h30'"
      ],
      [
        "Dimanche ",
        "3/24/2024",
        "CS DON BOSCO",
        "AS VITA CLUB",
        "TP MAZEMBE",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 6", "", "", "", "", ""],
      [
        "Vendredi",
        "3/29/2024",
        "LES AIGLES DU CONGO",
        "FC Saint Eloi Lupopo",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "Samedi",
        "3/30/2024",
        "AS MANIEMA UNION",
        "TP MAZEMBE",
        "Stade Jopeh Kabila ",
        "15h30'"
      ],
      [
        "",
        "3/30/2024",
        "FC LUBUMBASHI SPORT",
        "CS DON BOSCO",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "Dimanche ",
        "4/1/2024",
        "AS VITA CLUB ",
        "AS DAUPHIN NOIR",
        "Tata Raphael ",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 7", "", "", "", "", ""],
      [
        "Vendredi",
        "4/5/2024",
        "FC Saint Eloi Lupopo",
        "AS DAUPHIN NOIR",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "Samedi",
        "4/6/2024",
        "TP MAZEMBE",
        "FC LUBUMBASHI SPORT",
        "TP MAZEMBE",
        "15h30'"
      ],
      [
        "",
        "4/6/2024",
        "CS DON BOSCO",
        "LES AIGLES DU CONGO",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "Dimanche ",
        "4/7/2024",
        "AS MANIEMA UNION",
        "AS VITA CLUB ",
        "Stade Jopeh Kabila ",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 8 ", "", "", "", "", ""],
      [
        "Vendredi",
        "4/12/2024",
        "AS DAUPHIN NOIR",
        "TP MAZEMBE",
        "Stade de l'unité ",
        "15h30'"
      ],
      [
        "Samedi",
        "4/13/2024",
        "FC LUBUMBASHI SPORT",
        "LES AIGLES DU CONGO",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "",
        "4/13/2024",
        "AS VITA CLUB",
        "FC Saint Eloi Lupopo",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "Dimanche ",
        "4/14/2024",
        "AS MANIEMA UNION",
        "CS DON BOSCO",
        "Stade Jopeh Kabila ",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 9", "", "", "", "", ""],
      [
        "Vendredi",
        "4/19/2024",
        "TP MAZEMBE",
        "FC Saint Eloi Lupopo",
        "Kalemi ",
        "15h30'"
      ],
      [
        "Samedi",
        "4/20/2024",
        "LES AIGLES DU CONGO",
        "AS MANIEMA UNION",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "",
        "4/20/2024",
        "CS DON BOSCO",
        "AS DAUPHIN NOIR ",
        "TP MAZEMBE",
        "15h30'"
      ],
      [
        "Dimanche ",
        "4/21/2024",
        "FC LUBUMBASHI SPORT ",
        "AS VITA CLUB ",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 10 ", "", "", "", "", ""],
      [
        "Vendredi",
        "4/26/2024",
        "FC Saint Eloi Lupopo vs ",
        "Bon Bosco ",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "Samedi",
        "4/27/2024",
        "AS MANIEMA UNION",
        "LES AIGLES DU CONGO",
        "Stade Jopeh Kabila ",
        "15h30'"
      ],
      [
        "",
        "4/27/2024",
        "AS DAUPHIN NOIR ",
        "FC LUBUMBASHI SPORT",
        "Stade de l'unité ",
        "15h30'"
      ],
      [
        "Dimanche ",
        "4/28/2024",
        "AS VITA CLUB",
        "TP MAZEMBEau Stade",
        "Tata Raphael ",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 11", "", "", "", "", ""],
      [
        "Vendredi",
        "5/3/2024",
        "LES AIGLES DU CONGO",
        "AS DAUPHIN NOIR ",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "Samedi",
        "5/4/2024",
        "FC LUBUMBASHI SPORT",
        "FC Saint Eloi Lupopo",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "",
        "5/4/2024",
        "TP MAZEMBE",
        "AS MANIEMA UNION ",
        "TP MAZEMBE",
        "15h30'"
      ],
      [
        "Dimanche ",
        "5/5/2024",
        "CS DON BOSCO",
        "AS VITA CLUB",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 12", "", "", "", "", ""],
      [
        "Vendredi",
        "5/10/2024",
        "AS DAUPHIN NOIR",
        "FC Saint Eloi Lupopo",
        "Stade de l'unité ",
        "15h30'"
      ],
      [
        "Samedi",
        "5/11/2024",
        "AS MANIEMA UNION",
        "FC Lubumbashi ",
        "Stade Joseph Kabila ",
        "15h30'"
      ],
      [
        "",
        "5/11/2024",
        "AS VITA CLUB",
        "LES AIGLES DU CONGO",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "Dimanche ",
        "5/12/2024",
        "CS DON BOSCO",
        "TP MAZEMBE",
        "TP MAZEMBE",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 13", "", "", "", "", ""],
      [
        "Vendredi",
        "4/17/2024",
        "FC Saint Eloi Lupopo ",
        "TP MAZEMBE",
        "Kalemi ",
        "15h30'"
      ],
      [
        "Samedi",
        "4/18/2024",
        "FC LUBUMBASHI SPORT",
        "AS DAUPHIN NOIR",
        "Stade KIBASA MALIBA",
        "15h30'"
      ],
      [
        "",
        "4/18/2024",
        "LES AIGLES DU CONGO",
        "AS VITA CLUB ",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "Dimanche ",
        "4/19/2024",
        "AS MANIEMA UNION",
        "CS DON BOSCO ",
        "Stade Joseph Kabila ",
        "15h30'"
      ],
    ],
    [
      ["JOURNEE 14 ", "", "", "", "", ""],
      [
        "Vendredi",
        "5/22/2024",
        "TP MAZEMBE",
        "CS DON BOSCO",
        "TP MAZEMBE",
        "15h30'"
      ],
      [
        "Samedi",
        "5/23/2024",
        "AS DAUPHIN NOIR ",
        "AS MANIEMA UNION",
        "Stade de l'unité ",
        "15h30'"
      ],
      [
        "",
        "5/23/2024",
        "AS VITA CLUB",
        "FC LUBUMBASHI SPORT",
        "Tata Raphael ",
        "15h30'"
      ],
      [
        "Dimanche ",
        "5/24/2024",
        "LES AIGLES DU CONGO",
        "FC Saint Eloi Lupopo ",
        "Tata Raphael ",
        "15h30'"
      ]
    ],
  ];

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      //color: Colors.red, // Status bar color
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Colors.black,
      //       Colors.black,
      //       Colors.black,
      //       Colors.black,
      //       Colors.black,
      //     ],
      //   ),
      // ),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: DefaultTabController(
          length: 14,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Programme des matchs"),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: Size(10, 40),
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "Calendrier officiel du playoff",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: List.generate(
                      14,
                      (index) => Tab(
                        text: "Jr ${index + 1}",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: List.generate(
                      14,
                      (e) {
                        return SizedBox(
                          //height: 300,
                          width: double.maxFinite,
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            children: List.generate(
                              rencontres[e].length,
                              (index) {
                                //
                                List rs = rencontres[e];
                                print("rs: ${rs.length} : $rs");
                                //
                                //print("rs: ${rs[i]}");
                                List mt = rs[index];
                                //print('rs: ${rs[i].runtimeType} : ${rs[i]}');
                                List ds = mt[1].split("/");

                                if (index == 0) {
                                  return Container();
                                } else {
                                  //
                                  var d = "";
                                  if (ds.isNotEmpty) {
                                    //
                                    print('ds : $ds');
                                    DateTime date = DateTime(int.parse(ds[1]),
                                        int.parse(ds[1]), int.parse(ds[0]));
                                    //
                                    d = DateFormat.yMMMEd().format(date);
                                  } else {
                                    print('ds : $ds');
                                  }
                                  //return Container();
                                  //
                                  return Card(
                                    //color: Colors.white,
                                    child: InkWell(
                                      onTap: () {
                                        //
                                        Get.dialog(
                                          Center(
                                            child: Card(
                                              elevation: 1,
                                              child: Container(
                                                height: 150,
                                                width: 200,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Image.asset(
                                                      'assets/LOGO LINAFOOT RDC.png',
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                                    const Text(
                                                      "Acheter le billé de ce match",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        //
                                                      },
                                                      child: Text("Acheter"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        height: 100,
                                        width: double.maxFinite,
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
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        //color: Colors.red,
                                                        image: DecorationImage(
                                                            image: ExactAssetImage(
                                                                "assets/${mt[2]}.png")),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "${mt[2]}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 8,
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
                                                          .spaceAround,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${rs[0][0]}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellow.shade700,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "$d - ${mt[5]}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .grey.shade500,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${mt[4]}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        index % 2 == 1
                                                            ? "Complé"
                                                            : "Place disponible",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 5,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors
                                                              .yellow.shade700,
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
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        //color: Colors.red,
                                                        image: DecorationImage(
                                                            image: ExactAssetImage(
                                                                "assets/${mt[3]}.png")),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      "${mt[3]}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 8,
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
                                }
                                // return SizedBox(
                                //   //height: 300,
                                //   width: double.maxFinite,
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: List.generate(rs.length, (i) {
                                //     }),
                                //   ),
                                // );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
