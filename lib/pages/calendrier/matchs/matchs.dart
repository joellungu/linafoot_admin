import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'journee.dart';
import 'match_controller.dart';
import 'nouveau_match.dart';

class Matchs extends StatelessWidget {
  //
  MatchController matchController = Get.find();
  //
  RxInt jr = 0.obs;
  String idCalendrier, categorie;
  //
  Matchs(this.idCalendrier, this.categorie) {
    load();
    //jr++;
  }
  //
  load() async {
    List l =
        await matchController.getAllJourneeDeLaSaison(idCalendrier, categorie);
    jr.value = l.isEmpty ? 1 : l.length;
    //
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return Obx(
      () => DefaultTabController(
        length: jr.value,
        child: Scaffold(
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
                    jr.value,
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
                    jr.value,
                    (e) {
                      print("response jr $e");
                      return Journee(
                        idCalendrier,
                        categorie,
                        e + 1,
                        key: UniqueKey(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //
              //matchController.getAllJourneeDeLaSaison(idCalendrier, categorie);
              jr++;
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
  //
}
