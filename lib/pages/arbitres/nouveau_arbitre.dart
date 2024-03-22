import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linafoot_admin/utils/Loader.dart';

import 'arbitre_controller.dart';

class NouveauArbitre extends StatelessWidget {
  //
  ArbitreController arbitreController = Get.find();
  //
  RxString path = "".obs;
  //
  TextEditingController nom = TextEditingController();
  TextEditingController postnom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController telephone = TextEditingController();
  //RxString telephone2 = "".obs;
  TextEditingController email = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController categorie = TextEditingController();
  RxString mdp = "".obs;
  //
  RxString dateCreation = "".obs;
  RxInt equipeBfin = 0.obs;
  //
  RxMap scoreMitemps = {}.obs;
  RxMap scoreFin = {}.obs;
  //
  RxInt division = 1.obs;
  List divisions = ["Première", "Deuxième", "Troisième"];
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
        title: Text("Nouvelle arbitre"),
        centerTitle: true,
        //     actions: [
        //       IconButton(
        //         onPressed: () async {
        //           //
        //           //
        //           //
        //           FilePickerResult? result = await FilePicker.platform.pickFiles(
        //             dialogTitle: "Fichier CSV de la commande",
        //             type: FileType.custom,
        //             allowedExtensions: ["CSV", "csv"],
        //           );
        //           //
        //           if (result != null) {
        //             //fl = result;
        //             File file = File(result.files.single.path!);
        //             // rowsAsListOfValues = await file
        //             //     .openRead()
        //             //     .transform(utf8.decoder)
        //             //     .transform(CsvToListConverter())
        //             //     .toList();
        //             //
        //             //filename.value = result.names[0]!;
        //             //
        //             //print('fields: $rowsAsListOfValues');
        //             //
        //             List<String> l = file.readAsLinesSync(); //.split("\n");
        //             l.removeAt(0);
        //             //
        //             List lx = [];
        //             //
        //             l.forEach((e) async {
        //               List x = e.split(";");
        //               // es.forEach((x) {
        //               //   //
        //               // });
        //               //
        //               /*public byte[] photo;
        // public boolean asPhoto;
        // public String nom;
        // public String postnom;
        // public String prenom;
        // public String telephone;
        // public String email;
        // public String adresse;
        // public String province;
        // public String categorie;
        // public String mdp
        //                         */
        //               print("es:::: -- ${x[0]} -- ${x[1]} -- ${x[2]} -- -- ");
        //               Map j = {
        //                 "nom": "${x[1]}",
        //                 "postnom": "",
        //                 "prenom": "",
        //                 "telephone": "",
        //                 "email": "",
        //                 "adresse": "",
        //                 "province": "${x[0]}",
        //                 "categorie": "",
        //                 "mdp": "",
        //               };
        //               String rep = await arbitreController.saveCommissaire2(j);
        //               print(rep);
        //               //lx.add(j);
        //               print("_");
        //               //rowsAsListOfValues.add(es);
        //               //
        //             });
        //             //saveall
        //             //equipeController.saveEquipe2(lx);
        //             //
        //             //rowsAsListOfValues.value = const CsvToListConverter().convert(data);
        //             //
        //             // print("dataa: ${l.length}");
        //             // print("data: ${rowsAsListOfValues.length}");
        //             // //
        //             // final input = File(fichier).openRead();
        //           } else {
        //             // User canceled the picker
        //           }
        //         },
        //         icon: Icon(Icons.add),
        //       ),
        //     ],
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
                  controller: nom,
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
                  "Postnom",
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
                  controller: postnom,
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
                  "Prenom",
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
                  controller: prenom,
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
                  "Téléphone 1",
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
                  controller: telephone,
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
                  "Email",
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
                  controller: email,
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
                  "Adresse",
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
                  controller: adresse,
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
                  "Région",
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
                  "Catégorie",
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
                  controller: categorie,
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

              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  //
                  Loader.loading();
                  /**
                   */
                  //
                  Map equipe = {
                    "nom": nom.text,
                    "postnom": postnom.text,
                    "prenom": prenom.text,
                    "telephone": telephone.text,
                    "email": email.text,
                    "adresse": adresse.text,
                    "province": provinces[province.value],
                    "categorie": categorie.text,
                    "mdp": "1234567",
                    "asPhoto": path.value.isEmpty,
                    "photo": path.value.isEmpty
                        ? null
                        : File(path.value).readAsBytesSync(),
                  };
                  //
                  arbitreController.saveCommissaire(equipe);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.maxFinite,
                  child: const Text("Enregistrer"),
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
