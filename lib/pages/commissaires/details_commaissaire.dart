import 'package:flutter/material.dart';
import 'package:linafoot_admin/pages/joueurs/joueurs.dart';
import 'package:linafoot_admin/utils/requete.dart';
import 'package:linafoot_admin/utils/utils.dart';

class DetailsCommissaire extends StatelessWidget {
  //
  Map commissaire;
  //
  DetailsCommissaire(this.commissaire);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${commissaire['nom']} ${commissaire['postnom']} ${commissaire['prenom']}"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 500,
          child: ListView(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: NetworkImage(
                        "${Requete.url}/commissaire/photo/${commissaire['id']}"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(commissaire, context, text, "nom", 3);
                  //
                },
                title: Text("Nom"),
                subtitle: Text("${commissaire['nom']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(commissaire, context, text, "postnom", 3);
                  //
                },
                title: Text("Postnom"),
                subtitle: Text("${commissaire['postnom']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(commissaire, context, text, "prenom", 3);
                  //
                },
                title: Text("Prenom"),
                subtitle: Text("${commissaire['prenom']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(
                      commissaire, context, text, "telephone", 3);
                  //
                },
                title: Text("Téléphone 1"),
                subtitle: Text("${commissaire['telephone']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(
                      commissaire, context, text, "telephone2", 3);
                  //
                },
                title: Text("Telephone 2"),
                subtitle: Text("${commissaire['telephone2']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(commissaire, context, text, "email", 3);
                  //
                },
                title: Text("Email"),
                subtitle: Text("${commissaire['email']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(commissaire, context, text, "adresse", 3);
                  //
                },
                title: Text("Adresse"),
                subtitle: Text("${commissaire['adresse']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(commissaire, context, text, "region", 3);
                  //
                },
                title: Text("Region"),
                subtitle: Text("${commissaire['region']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(
                      commissaire, context, text, "categorie", 3);
                  //
                },
                title: Text("Catégorie"),
                subtitle: Text("${commissaire['categorie']}"),
                trailing: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
  //
}
