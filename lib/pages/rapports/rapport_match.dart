import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'rapport_controller.dart';
import 'rapport_journee.dart';

class RapportMatchs extends StatelessWidget {
  //
  RapportController rapportController = Get.find();
  //
  RxInt jr = 0.obs;
  String idCalendrier, categorie;
  //
  RapportMatchs(this.idCalendrier, this.categorie) {
    load();
    //jr++;
  }
  //
  load() async {
    List l = await rapportController.getAllJourneeDeLaSaison(
        idCalendrier, categorie);
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
                      return RapportJournee(
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
        ),
      ),
    );
  }
  //
}
