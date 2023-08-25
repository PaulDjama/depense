// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'historique_item_new.dart';
import 'package:depenses/models/depense.dart';

class Historique extends StatelessWidget {
  final List<Depense> listDepense;
  final Function supprimer;

  const Historique({
    Key? key,
    required this.listDepense,
    required this.supprimer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listDepense.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(listDepense[index]),
          onDismissed: (direction) {
            supprimer(listDepense[index].id);
          },
          background: Container(
            color: Colors.red[300],
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
          child: HistoriqueItemNew(
            libele: listDepense[index].libele,
            montant: listDepense[index].montant,
            texteDate: listDepense[index].dateformatee,
            icone: categorieIcons[listDepense[index].categorie]!,
          ),
        ),
      ),
    );
  }
}
