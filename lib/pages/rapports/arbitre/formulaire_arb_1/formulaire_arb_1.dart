import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/arbitre/arbitre_controller.dart';

class FormulaireArb1 extends StatelessWidget {
  //
  PageController controller;
  //
  ArbitreController2 arbitreController = Get.find();
  //
  RxInt equipeAmin = 0.obs;
  RxInt equipeBmin = 0.obs;
  //
  RxInt equipeAfin = 0.obs;
  RxInt equipeBfin = 0.obs;
  //
  RxMap scoreMitemps = {}.obs;
  RxMap scoreFin = {}.obs;
  //
  //
  List competitions = [
    "Ligue 1",
    "Ligue 2",
  ];
  //
  RxInt competition = 0.obs;
  //
  RxString date = "".obs;
  RxString heure = "".obs;
  //
  FormulaireArb1(this.controller);

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Match N°",
            style: textStyle,
          ),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: TextField(
            controller: arbitreController.nMatch.value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Competition°",
            style: textStyle,
          ),
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Obx(
            () => DropdownButtonHideUnderline(
              child: DropdownButton(
                padding: const EdgeInsets.only(left: 10),
                value: arbitreController.competition.value,
                onChanged: (e) {
                  //
                  //arbitreController.competition.value = e as int;
                },
                items: List.generate(competitions.length, (index) {
                  //
                  return DropdownMenuItem(
                    value: index,
                    child: Text("${competitions[index]}"),
                  );
                }),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Equipe A",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              // ListTile(
              //   onTap: () {
              //     //
              //     Recherche.affiche(ListEquipe("Equipe A"), context);
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => arbitreController.equipeA['nom'] != null
                    ? ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcBaselineSportsSoccer.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'GalaPortrait1.svg',
                        ),
                        title: Text("${arbitreController.equipeA['nom']}"),
                        subtitle:
                            Text("${arbitreController.equipeA['province']}"),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //
                            arbitreController.equipeA.value = {};
                          },
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Equipe B",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              // ListTile(
              //   onTap: () {
              //     //
              //     Recherche.affiche(ListEquipe("Equipe B"), context);
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => arbitreController.equipeB['nom'] != null
                    ? ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcBaselineSportsSoccer.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'GalaPortrait1.svg',
                        ),
                        title: Text("${arbitreController.equipeB['nom']}"),
                        subtitle:
                            Text("${arbitreController.equipeB['province']}"),
                        // trailing: IconButton(
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     arbitreController.equipeB.value = {};
                        //   },
                        // ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Joué à",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: TextField(
            controller: arbitreController.jouea.value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Joué au stade",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              // ListTile(
              //   onTap: () {
              //     //
              //     //
              //     Recherche.affiche(ListStades(), context);
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => arbitreController.stade.isEmpty
                    ? Container()
                    : ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/F7Sportscourt.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcSharpLocationOn.svg',
                        ),
                        title: Text("${arbitreController.stade['nom']}"),
                        subtitle:
                            Text("${arbitreController.stade['province']}"),
                        // trailing: const Icon(
                        //   Icons.delete,
                        //   color: Colors.red,
                        // ),
                      ),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Date",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  //
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030),
                  ).then((d) {
                    if (d != null) {
                      //
                      arbitreController.date.value =
                          "${d.day}-${d.month}-${d.year}";
                    }
                    //
                  });
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => arbitreController.date.value == ""
                    ? Container()
                    : ListTile(
                        onTap: () {
                          //
                        },
                        leading: Icon(
                          Icons.calendar_month,
                          color: Colors.blue.shade700,
                        ),
                        title: Text(arbitreController.date.value),
                        subtitle: Text(arbitreController.date.value),
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Heure",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  //
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    //lastDate: TimeOfDay(2030),
                  ).then((d) {
                    if (d != null) {
                      //
                      arbitreController.heure.value = "${d.hour}:${d.minute}";
                    }
                    //
                  });
                },
                title: const Text("Ajouter"),
                trailing: const Icon(Icons.add),
              ),
              Obx(
                () => arbitreController.heure.value == ""
                    ? Container()
                    : ListTile(
                        onTap: () {
                          //
                        },
                        leading: Icon(
                          Icons.timelapse,
                          color: Colors.blue.shade700,
                        ),
                        title: Text(arbitreController.heure.value),
                        subtitle: Text(arbitreController.heure.value),
                      ),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Nombre de spectateurs",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: TextField(
            controller: arbitreController.nombreSpectateur.value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Résultat à la mi-temps",
            style: textStyle,
          ),
        ),
        InkWell(
          onTap: () {
            //
            TextEditingController scoreA = TextEditingController();
            TextEditingController scoreB = TextEditingController();
            //
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (c) {
                //

                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: scoreA,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                              "Score de ${arbitreController.equipeA['nom']}"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      TextField(
                        controller: scoreB,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                              "Score de ${arbitreController.equipeB['nom']}"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //
                          arbitreController.scoreMitemps['a'] = scoreA.text;
                          arbitreController.scoreMitemps['b'] = scoreB.text;
                          //
                          Get.back();
                          //
                          print("scoreMitemps : $scoreMitemps");
                          //
                        },
                        child: Text("Enregistrer"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade600,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Obx(
                          () => arbitreController.equipeA['nom'] == null
                              ? Text("Equipe A - ")
                              : Text(
                                  "${arbitreController.equipeA['nom']}",
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${arbitreController.scoreMitemps['a'] ?? '0'}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  alignment: Alignment.center,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          "${arbitreController.scoreMitemps['b'] ?? '0'} ",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      //Text(" - Equipe B"),
                      Expanded(
                        flex: 1,
                        child: Obx(
                          () => arbitreController.equipeB['nom'] == null
                              ? Text("Equipe B - ")
                              : Text(
                                  "${arbitreController.equipeB['nom']}",
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Résultat final",
            style: textStyle,
          ),
        ),
        InkWell(
          onTap: () {
            //
            TextEditingController scoreA = TextEditingController();
            TextEditingController scoreB = TextEditingController();
            //
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (c) {
                //

                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextField(
                        controller: scoreA,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                              "Score de ${arbitreController.equipeA['nom']}"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      TextField(
                        controller: scoreB,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                              "Score de ${arbitreController.equipeB['nom']}"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //
                          arbitreController.scoreFin['a'] = scoreA.text;
                          arbitreController.scoreFin['b'] = scoreB.text;
                          //
                          Get.back();
                          //
                        },
                        child: Text("Enregistrer"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade600,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Obx(
                          () => arbitreController.equipeA['nom'] == null
                              ? Text("Equipe A - ")
                              : Text(
                                  "${arbitreController.equipeA['nom']}",
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${arbitreController.scoreFin['a'] ?? '0'}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  alignment: Alignment.center,
                  child: Text(":"),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          "${arbitreController.scoreFin['b'] ?? '0'} ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      //Text(" - Equipe B"),
                      Expanded(
                        flex: 1,
                        child: Obx(
                          () => arbitreController.equipeB['nom'] == null
                              ? Text("Equipe B - ")
                              : Text(
                                  "${arbitreController.equipeB['nom']}",
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Commissaire du match",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              // ListTile(
              //   onTap: () {
              //     //
              //     Recherche.affiche(
              //         ListCommissaire("Commissaire du match"), context);
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => arbitreController.commissaire['nom'] != null
                    ? ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcTwotoneSports.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcTwotoneSports.svg',
                        ),
                        title: Text("${arbitreController.commissaire['nom']}"),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Region: ",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            Text("${arbitreController.commissaire['region']}")
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     arbitreController.arbitreCentral.value = {};
                        //     //
                        //   },
                        // ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Arbitre central",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              // ListTile(
              //   onTap: () {
              //     //
              //     Recherche.affiche(ListArbitre("Arbitre central"), context);
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => arbitreController.arbitreCentral['nom'] != null
                    ? ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcTwotoneSports.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcTwotoneSports.svg',
                        ),
                        title:
                            Text("${arbitreController.arbitreCentral['nom']}"),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Region: ",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                                "${arbitreController.arbitreCentral['region']}")
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     arbitreController.arbitreCentral.value = {};
                        //     //
                        //   },
                        // ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Arbitre assistant 1",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              // ListTile(
              //   onTap: () {
              //     //
              //     Recherche.affiche(
              //         ListArbitre("Arbitre assistant 1"), context);
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => arbitreController.arbitreAssistant1['nom'] != null
                    ? ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcTwotoneSupportAgent.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcTwotoneSupportAgent.svg',
                        ),
                        title: Text(
                            "${arbitreController.arbitreAssistant1['nom']}"),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Region: ",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                                "${arbitreController.arbitreAssistant1['region']}"),
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     arbitreController.arbitreAssistant1.value = {};
                        //     //
                        //   },
                        // ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        //
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Arbitre assistant 2",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              // ListTile(
              //   onTap: () {
              //     //
              //     Recherche.affiche(
              //         ListArbitre("Arbitre assistant 2"), context);
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => arbitreController.arbitreAssistant2['nom'] != null
                    ? ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcTwotoneSupportAgent.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcTwotoneSupportAgent.svg',
                        ),
                        title: Text(
                            "${arbitreController.arbitreAssistant2['nom']}"),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Region: ",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                                "${arbitreController.arbitreAssistant2['region']}"),
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     arbitreController.arbitreAssistant2.value = {};
                        //     //
                        //   },
                        // ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Arbitre protocolaire",
            style: textStyle,
          ),
        ),
        Container(
          //height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Column(
            children: [
              // ListTile(
              //   onTap: () {
              //     //
              //     Recherche.affiche(
              //         ListArbitre("Arbitre protocolaire"), context);
              //     //
              //   },
              //   title: const Text("Ajouter"),
              //   trailing: const Icon(Icons.add),
              // ),
              Obx(
                () => arbitreController.arbitreProtocolaire['nom'] != null
                    ? ListTile(
                        onTap: () {
                          //
                        },
                        leading: SvgPicture.asset(
                          'assets/IcTwotoneSports.svg',
                          width: 25,
                          height: 25,
                          color: Colors.blue,
                          semanticsLabel: 'IcTwotoneSports.svg',
                        ),
                        title: Text(
                            "${arbitreController.arbitreProtocolaire['nom']}"),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Region: ",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                                "${arbitreController.arbitreProtocolaire['region']}"),
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     arbitreController.arbitreProtocolaire.value = {};
                        //     //
                        //   },
                        // ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
        //

        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );
}
