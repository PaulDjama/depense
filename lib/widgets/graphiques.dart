// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:depenses/models/depense.dart';
import 'package:depenses/widgets/graphique_item.dart';
import 'package:flutter/material.dart';

class Graphique extends StatelessWidget {
  final List<Depense> listDepenses;
  const Graphique({
    Key? key,
    required this.listDepenses,
  }) : super(key: key);
  double sommeTotale() {
    var somme = 0.0;
    for (var element in listDepenses) {
      somme = somme + element.montant;
    }
    return somme;
  }

  double sommeParCategorie(Categorie cat) {
    var somme = 0.0;
    final depensesCat = listDepenses.where(
      (element) => element.categorie == cat,
    );
    for (var element in depensesCat) {
      somme = somme + element.montant;
    }
    return somme;
  }

  @override
  Widget build(BuildContext context) {
    final total = sommeTotale();
    return Container(
      padding: const EdgeInsets.all(16),
      height: 250,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...Categorie.values.map(
            (e) => GraphiqueItem(
              fraction: sommeParCategorie(e) / total,
              icon: categorieIcons[e]!,
            ),
          ),
        ],
      ),
    );
  }
}
