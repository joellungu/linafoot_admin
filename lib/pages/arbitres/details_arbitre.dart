import 'package:flutter/material.dart';
import 'package:linafoot_admin/pages/joueurs/joueurs.dart';
import 'package:linafoot_admin/utils/requete.dart';
import 'package:linafoot_admin/utils/utils.dart';

class DetailsArbitre extends StatelessWidget {
  //
  Map arbitre;
  //
  DetailsArbitre(this.arbitre);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${arbitre['nom']} ${arbitre['postnom']} ${arbitre['prenom']}"),
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
                        "${Requete.url}/commissaire/photo/${arbitre['id']}"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  var text = TextEditingController();
                  //
                  Utils.modifierInfo(arbitre, context, text, "nom", 4);
                  //
                },
                title: Text("Nom"),
                subtitle: Text("${arbitre['nom']}"),
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
                  Utils.modifierInfo(arbitre, context, text, "postnom", 4);
                  //
                },
                title: Text("Postnom"),
                subtitle: Text("${arbitre['postnom']}"),
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
                  Utils.modifierInfo(arbitre, context, text, "prenom", 4);
                  //
                },
                title: Text("Prenom"),
                subtitle: Text("${arbitre['prenom']}"),
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
                  Utils.modifierInfo(arbitre, context, text, "telephone", 4);
                  //
                },
                title: Text("Téléphone 1"),
                subtitle: Text("${arbitre['telephone']}"),
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
                  Utils.modifierInfo(arbitre, context, text, "telephone2", 4);
                  //
                },
                title: Text("Telephone 2"),
                subtitle: Text("${arbitre['telephone2']}"),
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
                  Utils.modifierInfo(arbitre, context, text, "email", 4);
                  //
                },
                title: Text("Email"),
                subtitle: Text("${arbitre['email']}"),
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
                  Utils.modifierInfo(arbitre, context, text, "adresse", 4);
                  //
                },
                title: Text("Adresse"),
                subtitle: Text("${arbitre['adresse']}"),
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
                  Utils.modifierInfo(arbitre, context, text, "region", 4);
                  //
                },
                title: Text("Region"),
                subtitle: Text("${arbitre['region']}"),
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
                  Utils.modifierInfo(arbitre, context, text, "categorie", 4);
                  //
                },
                title: Text("Catégorie"),
                subtitle: Text("${arbitre['categorie']}"),
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
