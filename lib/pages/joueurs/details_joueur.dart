import 'package:flutter/material.dart';
import 'package:linafoot_admin/pages/joueurs/joueurs.dart';
import 'package:linafoot_admin/utils/requete.dart';
import 'package:linafoot_admin/utils/utils.dart';

class DetailsJoueur extends StatelessWidget {
  //
  Map joueur;
  //
  DetailsJoueur(this.joueur);
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
              image:
                  NetworkImage("${Requete.url}/joueur/profile/${joueur['id']}"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            //
            var text = TextEditingController();
            //
            Utils.modifierInfo(joueur, context, text, "nom", 2);
            //
          },
          title: Text("Nom"),
          subtitle: Text("${joueur['nom']}"),
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
            Utils.modifierInfo(joueur, context, text, "postnom", 2);
            //
          },
          title: Text("Postnom"),
          subtitle: Text("${joueur['postnom']}"),
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
            Utils.modifierInfo(joueur, context, text, "prenom", 2);
            //
          },
          title: Text("Prenom"),
          subtitle: Text("${joueur['prenom']}"),
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
            Utils.modifierInfo(joueur, context, text, "dateNaissance", 2);
            //
          },
          title: Text("Date de naissance"),
          subtitle: Text("${joueur['dateNaissance']}"),
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
            Utils.modifierInfo(joueur, context, text, "telephone", 2);
            //
          },
          title: Text("Telephone"),
          subtitle: Text("${joueur['telephone']}"),
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
            Utils.modifierInfo(joueur, context, text, "email", 2);
            //
          },
          title: Text("Email"),
          subtitle: Text("${joueur['email']}"),
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
            Utils.modifierInfo(joueur, context, text, "adresse", 2);
            //
          },
          title: Text("Adresse"),
          subtitle: Text("${joueur['adresse']}"),
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
            Utils.modifierInfo(joueur, context, text, "licence", 2);
            //
          },
          title: Text("Licence"),
          subtitle: Text("${joueur['licence']}"),
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
            Utils.modifierInfo(joueur, context, text, "numero", 2);
            //
          },
          title: Text("Numero"),
          subtitle: Text("${joueur['numero']}"),
          trailing: const Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
  //
}
