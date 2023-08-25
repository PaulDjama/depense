import 'package:depenses/nouvelle_depense.dart';
import 'package:depenses/widgets/graphiques.dart';
import 'package:depenses/widgets/historique.dart';
import 'package:depenses/models/depense.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
} // 15h14

class _PageAcceuilState extends State<PageAcceuil> {
  final List<Depense> depenses = [
    Depense(
      montant: 454,
      libele: 'nourriture',
      date: DateTime.now(),
      categorie: Categorie.nourriture,
    ),
    Depense(
      montant: 454,
      libele: 'vetements',
      date: DateTime.now(),
      categorie: Categorie.vetement,
    ),
    Depense(
      montant: 258,
      libele: 'jouets',
      date: DateTime.now(),
      categorie: Categorie.loyer,
    ),
  ];

  void afficherFormulaire() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NouvelleDepense(
        onAjouter: enregistrer,
      ),
    );
  }

  void enregistrer(Depense depense) {
    setState(() {
      depenses.insert(0, depense);
    });
  }

  void supprimerDepense(String id) {
    final aSupprimer = depenses.firstWhere((element) => element.id == id);
    final index = depenses.indexOf(aSupprimer);

    setState(() {
      depenses.remove(aSupprimer);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('la depense a ete supprimé avec succes'),
        action: SnackBarAction(
          label: 'ANNULER',
          onPressed: () {
            setState(() {
              depenses.insert(index, aSupprimer);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text("$width"),
        actions: [
          IconButton(
            onPressed: afficherFormulaire,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: depenses.isEmpty
          ? const Center(
              child: Text("Vous n'avez pas de depense enregistrée !"),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: LayoutBuilder(builder: (ctx, contraintes) {
                final largeur = contraintes.maxWidth;
                return largeur < 750
                    ? Column(
                        children: [
                          Graphique(
                            listDepenses: depenses,
                          ),
                          const Gap(20),
                          Historique(
                            listDepense: depenses,
                            supprimer: supprimerDepense,
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Graphique(
                              listDepenses: depenses,
                            ),
                          ),
                          const Gap(20),
                          Historique(
                            listDepense: depenses,
                            supprimer: supprimerDepense,
                          ),
                        ],
                      );
              }),
            ),
    );
  }
}
