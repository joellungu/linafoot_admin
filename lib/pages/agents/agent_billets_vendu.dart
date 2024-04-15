import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:linafoot_admin/pages/agents/agents_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';
import 'package:linafoot_admin/utils/requete.dart';

class AgentBilletVendu extends GetView {
  //
  String idAgent;
  //
  String idMatch;
  //
  AgentBilletVendu(this.idMatch, this.idAgent);
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
            future: agentsController.getAllBilletVendus(idMatch, idAgent),
            builder: (c, t) {
              //
              if (t.hasData) {
                List matchs = t.data as List;
                //List tris = triJournee(matchs);
                RxString mot = "".obs;
                return Center(
                  child: Container(
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          alignment: Alignment.center,
                          child: Text("Total vendu: ${matchs.length}"),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListView(
                            padding: EdgeInsets.all(10),
                            children: List.generate(
                              matchs.length,
                              (index) {
                                //
                                Map billet = matchs[index];
                                //
                                return ListTile(
                                  leading: Icon(CupertinoIcons.ticket),
                                  title: Text(
                                      "${billet['nomEquipeA']} vs ${billet['nomEquipeB']}"),
                                  subtitle: Text(
                                      "${billet['date']}  ${billet['heure']}"),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
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
}
