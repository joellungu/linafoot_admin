import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/rapport.dart';
import 'package:linafoot_admin/utils/langi.dart';
import 'agents/agents.dart';
import 'arbitres/arbitres.dart';
import 'calendrier/calendrier.dart';
import 'commissaires/commissaires.dart';
import 'equipes/equipes.dart';
import 'stade/stade.dart';

class Accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return _Accueil();
  }
  //
}

class _Accueil extends State<Accueil> {
  // HoraireController horaireController = Get.put(HoraireController());
  // //
  // InfosController infosController = Get.put(InfosController());
  // //
  // LiveController liveController = Get.put(LiveController());
  // //
  // NiveauController niveauController = Get.put(NiveauController());
  //
  //Horaire//Calendrier//Evenement//Utilisateur//Infos//Live/
  Rx<Widget> vue = Rx(Equipes()); //
  RxInt choix = 0.obs;
  //"Encaissement", "Décaissement"
  List angles = [
    {"titre": "Equipes", "icon": "IcBaselineSportsSoccer"},
    {"titre": "Commissaire", "icon": "GalaPortrait1"},
    {"titre": "Arbitre", "icon": "IonPeople"},
    //{"titre": "Live", "icon": "IconParkSolidPlay"},
    //{"titre": "Programme", "icon": "PhCalendarCheckFill"},
    {"titre": "Calendrier", "icon": "HeroiconsCalendarDaysSolid"},
    //{"titre": "Annonces", "icon": "SolarLightbulbMinimalisticBold"},

    {"titre": "Rapport", "icon": "GalaEditor"},
    //{"titre": "Stats", "icon": "GalaChart"},

    {"titre": "Agents", "icon": "IonPeople"},
    //{"titre": "Parametres", "icon": "SolarSettingsMinimalisticBold"},
    {"titre": "Stades", "icon": "F7Sportscourt"},
    // {"titre": "Clients & Fournisseurs", "icon": "F7Sportscourt"},
    // {"titre": "Programme", "icon": "SolarSettingsMinimalisticBold"},
  ];
  //
  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    //_tabController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Langi.base1,
      child: SafeArea(
        child: Scaffold(
          body: Obx(() => vue.value),
          bottomNavigationBar: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(angles.length, (index) {
                Map e = angles[index];
                return InkWell(
                  onTap: () {
                    //
                    choix.value = index;
                    //
                    if (choix.value == 0) {
                      vue.value = Equipes();
                    } else if (choix.value == 1) {
                      vue.value = Commissaires();
                    } else if (choix.value == 2) {
                      vue.value = Arbitres();
                    } else if (choix.value == 3) {
                      vue.value = Calendrier();
                    } else if (choix.value == 4) {
                      vue.value = Rapports();
                      // } else if (choix.value == 5) {
                      //   vue.value = Container();
                      // } else if (choix.value == 6) {
                      //   vue.value = Rapports();
                      // } else if (choix.value == 7) {
                      //   vue.value = Container();
                      // } else if (choix.value == 8) {
                      //Changementelse if (choix.value == 5) {
                    } else if (choix.value == 5) {
                      vue.value = Agents();
                      //Changementelse if (choix.value == 5) {
                      //vue.value = State();
                    } else {
                      //
                      vue.value = Stade();
                    }
                  },
                  child: Obx(
                    () => SizedBox(
                      //flex: 1,
                      //width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/${e["icon"]}.svg",
                            colorFilter: index == choix.value
                                ? const ColorFilter.mode(
                                    Colors.blue, BlendMode.srcIn)
                                : const ColorFilter.mode(
                                    Colors.grey, BlendMode.srcIn),
                            semanticsLabel: e["titre"],
                            height: 30,
                            width: 30,
                          ),
                          Text(
                            e["titre"],
                            style: TextStyle(
                              fontSize: 10,
                              color: index == choix.value
                                  ? Colors.blue
                                  : Colors.grey,
                              fontWeight: index == choix.value
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () async {
          //     //
          //     String mdpGenerer() {
          //       //
          //       var r = Random();
          //       //
          //       String mdp = "";
          //       for (int t = 0; t < 10; t++) {
          //         mdp = "$mdp${r.nextInt(10)}";
          //       }
          //       return mdp;
          //     }

          //     //
          //     print("mdp: ${mdpGenerer()}");
          //   },
          //   child: const Icon(Icons.add),
          // ),
        ),
      ),
    );
  }
}
