import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:linafoot_admin/pages/calendrier/matchs/match_controller.dart';
import 'package:linafoot_admin/pages/calendrier/matchs/matchs.dart';

import 'rapport_match.dart';

class CategorieRapport extends StatelessWidget {
  String idCalendrier;
  String cat;
  CategorieRapport(this.idCalendrier, this.cat);
  //

  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 14,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              child: Text(
                "Organisation du calendrier",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: RapportMatchs(idCalendrier, cat),
            ),
          ],
        ),
      ),
    );
  }
}
