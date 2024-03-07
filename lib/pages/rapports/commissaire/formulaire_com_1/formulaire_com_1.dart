import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linafoot_admin/pages/rapports/commissaire/commissaire_controller.dart';

class FormulaireCom1 extends StatelessWidget {
  //
  PageController controller;
  //
  Map match;
  //
  CommissaireController2 commissaireController = Get.find();
  //
  RxInt equipeAmin = 0.obs;
  RxInt equipeBmin = 0.obs;
  //
  RxInt equipeAfin = 0.obs;
  RxInt equipeBfin = 0.obs;
  //

  //
  RxString heure = "".obs;

  //
  FormulaireCom1(this.controller, this.match) {
    //
    getInfos();
  }
  //
  getInfos() async {
    //
    DateTime d = DateTime.now();
    //
    //commissaireController.commissaire.value = await commissaireController
    // .getOneCommissaire("${match['commissaire']}");
    //
    commissaireController.date.value = "${d.day}-${d.month}-${d.year}";
    //
  }

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
            "Commissaire du match",
            style: textStyle,
          ),
        ),
        Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade600,
            ),
          ),
          child: Obx(
            () => ListTile(
              leading: SvgPicture.asset(
                'assets/GalaPortrait1.svg',
                width: 25,
                height: 25,
                color: Colors.blue,
                semanticsLabel: 'GalaPortrait1.svg',
              ),
              title: Text(
                  "${commissaireController.commissaire['nom'] ?? ''} ${commissaireController.commissaire['postnom'] ?? ''} ${commissaireController.commissaire['prenom'] ?? ''}"),
              subtitle: Text(
                  "${commissaireController.commissaire['telephone'] ?? ''}"),
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
            "Heure du match",
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
              Obx(
                () => commissaireController.heure.value.isNotEmpty
                    ? Text(
                        commissaireController.heure.value,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
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
              Obx(
                () => commissaireController.equipeA['nom'] != null
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
                        title: Text("${commissaireController.equipeA['nom']}"),
                        subtitle: Text(
                            "${commissaireController.equipeA['province']}"),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.equipeA.value = {};
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
              Obx(
                () => commissaireController.equipeB['nom'] != null
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
                        title: Text("${commissaireController.equipeB['nom']}"),
                        subtitle: Text(
                            "${commissaireController.equipeB['province']}"),
                        // trailing: IconButton(
                        //   icon: const Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.equipeB.value = {};
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
              Obx(
                () => commissaireController.stade.isEmpty
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
                        title: Text("${commissaireController.stade['nom']}"),
                        subtitle:
                            Text("${commissaireController.stade['province']}"),
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
            "Résultat à la mi-temps",
            style: textStyle,
          ),
        ),
        InkWell(
          onTap: () {
            //
            // TextEditingController scoreA = TextEditingController();
            // TextEditingController scoreB = TextEditingController();
            // //
            // showModalBottomSheet(
            //   context: context,
            //   isScrollControlled: true,
            //   builder: (c) {
            //     //
            //     return Container(
            //       padding: EdgeInsets.all(10),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           TextField(
            //             controller: scoreA,
            //             keyboardType: TextInputType.number,
            //             decoration: InputDecoration(
            //               label: Text(
            //                   "Score de ${commissaireController.equipeA['nom']}"),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //           ),
            //           TextField(
            //             controller: scoreB,
            //             keyboardType: TextInputType.number,
            //             decoration: InputDecoration(
            //               label: Text(
            //                   "Score de ${commissaireController.equipeB['nom']}"),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //           ),
            //           ElevatedButton(
            //             onPressed: () {
            //               //
            //               commissaireController.scoreMitemps['a'] = scoreA.text;
            //               commissaireController.scoreMitemps['b'] = scoreB.text;
            //               //
            //               Get.back();
            //               //
            //               print(
            //                   "scoreMitemps : ${commissaireController.scoreMitemps}");
            //               //
            //             },
            //             child: Text("Enregistrer"),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // );
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
                          () => commissaireController.equipeA['nom'] == null
                              ? Text("Equipe A - ")
                              : Text(
                                  "${commissaireController.equipeA['nom']}",
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${commissaireController.scoreMitemps['a'] ?? '0'}",
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
                          "${commissaireController.scoreMitemps['b'] ?? '0'} ",
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
                          () => commissaireController.equipeB['nom'] == null
                              ? Text("Equipe B - ")
                              : Text(
                                  "${commissaireController.equipeB['nom']}",
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
            // TextEditingController scoreA = TextEditingController();
            // TextEditingController scoreB = TextEditingController();
            // //
            // showModalBottomSheet(
            //   context: context,
            //   isScrollControlled: true,
            //   builder: (c) {
            //     //
            //     return Container(
            //       padding: EdgeInsets.all(10),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           TextField(
            //             controller: scoreA,
            //             keyboardType: TextInputType.number,
            //             decoration: InputDecoration(
            //               label: Text(
            //                   "Score de ${commissaireController.equipeA['nom']}"),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //           ),
            //           TextField(
            //             controller: scoreB,
            //             keyboardType: TextInputType.number,
            //             decoration: InputDecoration(
            //               label: Text(
            //                   "Score de ${commissaireController.equipeB['nom']}"),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //           ),
            //           ElevatedButton(
            //             onPressed: () {
            //               //
            //               commissaireController.scoreFin['a'] = scoreA.text;
            //               commissaireController.scoreFin['b'] = scoreB.text;
            //               //
            //               Get.back();
            //               //
            //             },
            //             child: Text("Enregistrer"),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // );
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
                          () => commissaireController.equipeA['nom'] == null
                              ? Text("Equipe A - ")
                              : Text(
                                  "${commissaireController.equipeA['nom']}",
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${commissaireController.scoreFin['a'] ?? '0'}",
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
                          "${commissaireController.scoreFin['b'] ?? '0'} ",
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
                          () => commissaireController.equipeB['nom'] == null
                              ? Text("Equipe B - ")
                              : Text(
                                  "${commissaireController.equipeB['nom']}",
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
              Obx(
                () => commissaireController.arbitreCentral['nom'] != null
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
                            "${commissaireController.arbitreCentral['nom']} ${commissaireController.arbitreCentral['postnom']} ${commissaireController.arbitreCentral['prenom']}"),
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
                                "${commissaireController.arbitreCentral['region']}")
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.arbitreCentral.value = {};
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
              Obx(
                () => commissaireController.arbitreAssistant1['nom'] != null
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
                            "${commissaireController.arbitreAssistant1['nom']} ${commissaireController.arbitreAssistant1['postnom']} ${commissaireController.arbitreAssistant1['prenom']}"),
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
                                "${commissaireController.arbitreAssistant1['region']}"),
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.arbitreAssistant1.value = {};
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
              Obx(
                () => commissaireController.arbitreAssistant2['nom'] != null
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
                            "${commissaireController.arbitreAssistant2['nom']} ${commissaireController.arbitreAssistant2['postnom']} ${commissaireController.arbitreAssistant2['prenom']}"),
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
                                  "${commissaireController.arbitreAssistant2['region']}"),
                            ]),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.arbitreAssistant2.value = {};
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
              Obx(
                () => commissaireController.arbitreProtocolaire['nom'] != null
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
                            "${commissaireController.arbitreProtocolaire['nom']} ${commissaireController.arbitreProtocolaire['postnom']} ${commissaireController.arbitreProtocolaire['prenom']}"),
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
                                "${commissaireController.arbitreProtocolaire['region']}"),
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        //   onPressed: () {
                        //     //
                        //     commissaireController.arbitreProtocolaire.value =
                        //         {};
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
        // const SizedBox(
        //   height: 20,
        // ),
        // //
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     InkWell(
        //       onTap: () {
        //         //
        //         controller.nextPage(
        //             duration: const Duration(milliseconds: 300),
        //             curve: Curves.ease);
        //         //
        //       },
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           color: Colors.blue,
        //           borderRadius: BorderRadius.only(
        //             topRight: Radius.circular(30),
        //             bottomRight: Radius.circular(30),
        //           ),
        //         ),
        //         alignment: Alignment.center,
        //         height: 50,
        //         width: 100,
        //         child: const Text(
        //           "Suivant 1/7",
        //           style: TextStyle(
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
