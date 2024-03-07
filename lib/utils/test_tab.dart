import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TestTab extends GetView {
  //AS DAUPHIN NOIR.png
  //AS MANIEMA UNION.png
  //AS VITA CLUB.png
  //CS DON BOSCO.png
  //LOGO VERTICAL HD.png
  //LES AIGLES DU CONGO.png
  //LUBUMBASHI SPORT.png
  //LUPOPO FC.png
  //TP MAZEMBE.png

  @override
  Widget build(BuildContext context) {
    //
    RxInt jr = 1.obs;
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
        child: Obx(
          () => DefaultTabController(
            length: jr.value,
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
                          return Container();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  //
                  jr++;
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/**
 
 */
