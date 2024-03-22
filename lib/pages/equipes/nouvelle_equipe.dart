import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linafoot_admin/pages/equipes/equipe_controller.dart';
import 'package:linafoot_admin/utils/Loader.dart';

class NouvelleEquipe extends StatelessWidget {
  //
  EquipeController equipeController = Get.find();
  //
  RxString nom = "".obs;
  RxString abreviation = "".obs;
  RxString path = "".obs;
  //
  //RxString province = "".obs;
  RxString dateCreation = "".obs;
  RxInt equipeBfin = 0.obs;
  //
  RxMap scoreMitemps = {}.obs;
  RxMap scoreFin = {}.obs;
  //
  RxInt division = 1.obs;
  List divisions = ["Première", "Deuxième"];
  //
  List provinces = [
    "Bas-Uele",
    "Équateur",
    "Haut-Katanga",
    "Haut-Lomami",
    "Haut-Uele",
    "Ituri",
    "Kasaï",
    "Kasaï central",
    "Kasaï oriental",
    "Kinshasa",
    "Kongo-Central",
    "Kwango",
    "Kwilu",
    "Lomami",
    "Lualaba",
    "Mai-Ndombe",
    "Maniema",
    "Mongala",
    "Nord-Kivu",
    "Nord-Ubangi",
    "Sankuru",
    "Sud-Kivu",
    "Sud-Ubangi",
    "Tanganyika",
    "Tshopo",
    "Tshuapa",
  ];
  RxInt province = 0.obs;
  //
  RxString heure = "".obs;
  //

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle Equipe"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          width: 500,
          child: ListView(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            children: [
              const SizedBox(
                height: 10,
              ),

              //
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Logo",
                  style: textStyle,
                ),
              ),
              Container(
                height: 300,
                width: 300,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(
                //     color: Colors.grey.shade600,
                //   ),
                // ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Obx(
                        () => path.value.isNotEmpty
                            ? Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(path.value),
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(),
                        child: InkWell(
                          onTap: () async {
                            //
                            final ImagePicker picker = ImagePicker();
                            XFile? files = await picker.pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 80,
                                maxWidth: 512,
                                maxHeight: 512);
                            //
                            if (files != null) {
                              path.value = files.path;
                            }
                          },
                          child: Card(
                            elevation: 1,
                            color: Colors.red.shade900,
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 40,
                              child: Icon(Icons.edit),
                            ),
                          ),
                        ),
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
                  "Nom",
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 55,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(
                //     color: Colors.grey.shade600,
                //   ),
                // ),
                child: TextField(
                  onChanged: (t) {
                    //
                    nom.value = t;
                  },
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
                  "Abreviation",
                  style: textStyle,
                ),
              ),
              SizedBox(
                height: 55,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(
                //     color: Colors.grey.shade600,
                //   ),
                // ),
                child: TextField(
                  onChanged: (t) {
                    //
                    abreviation.value = t;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Province",
                  style: textStyle,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton(
                      onChanged: (e) {
                        //
                        province.value = e as int;
                      },
                      value: province.value,
                      items: List.generate(
                        provinces.length,
                        (index) => DropdownMenuItem(
                          value: index,
                          child: Text("${provinces[index]}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Date de création",
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
                                initialDate: DateTime.now(),
                                lastDate: DateTime(2050),
                                firstDate: DateTime(1900))
                            .then((d) {
                          //
                          if (d != null) {
                            dateCreation.value =
                                "${d.day}-${d.month}-${d.year}";
                          }
                        });
                        //Recherche.affiche(ListEquipe("Equipe B"), context);
                      },
                      title: const Text("Ajouter"),
                      trailing: const Icon(Icons.calendar_month),
                    ),
                    Obx(
                      () => dateCreation.value.isNotEmpty
                          ? Text(
                              dateCreation.value,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
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
                  "division",
                  style: textStyle,
                ),
              ),
              //
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade500,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: Obx(
                    () => DropdownButton(
                      onChanged: (e) {
                        //
                        division.value = e as int;
                      },
                      value: division.value,
                      items: List.generate(
                        divisions.length,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${divisions[index]}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //
              //
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  //
                  Loader.loading();
                  /**
                  nom;
    public String abrev;
    public String province;
    public byte[] logo;
    public String dateCreation;
    public String division
                   */
                  //
                  Map equipe = {
                    "nom": nom.value,
                    "abrev": abreviation.value,
                    "province": provinces[province.value],
                    "logo": File(path.value).readAsBytesSync(),
                    "dateCreation": dateCreation.value,
                    "division": divisions[division.value],
                  };
                  //
                  equipeController.saveEquipe(equipe);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Enregistrer"),
                  height: 50,
                  width: double.maxFinite,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
  //
}
