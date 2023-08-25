// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:depenses/models/depense.dart';

final formateur = DateFormat.yMd();

class NouvelleDepense extends StatefulWidget {
  final Function onAjouter;
  const NouvelleDepense({
    Key? key,
    required this.onAjouter,
  }) : super(key: key);

  @override
  State<NouvelleDepense> createState() => _NouvelleDepenseState();
}

class _NouvelleDepenseState extends State<NouvelleDepense> {
  final libeleControler = TextEditingController();
  final montantControler = TextEditingController();
  DateTime? date;
  var categorieChoisie = Categorie.loyer;

  @override
  void dispose() {
    libeleControler.dispose();
    montantControler.dispose();
    super.dispose();
  }

  void enregistrer() {
    //on verifie si les types sont valides dans enregistrer
    final libeleText = libeleControler.text.trim();
    final libeleValide = libeleText.isNotEmpty && libeleText.length > 2;
    final montant = double.tryParse(montantControler.text);
    var montantValide = false;

    if (montant != null) {
      montantValide = montant > 0 && montant < 1000000000;
    }
    final dateValide = date != null;
    if (dateValide && montantValide && libeleValide) {
      final temp = Depense(
        categorie: categorieChoisie,
        libele: libeleText,
        montant: montant!,
        date: date!,
      );
      widget.onAjouter(temp);
      Navigator.of(context).pop();
    } else {
      afficherMessageErreur();
    }
  }

  void afficherMessageErreur() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Une erreur est survenue'),
        content: const Text(
            'veuillez renseigner une date, un montant et un libele valide'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.deepPurple,
            ),
            child: const Text('ok'),
          ),
        ],
      ),
    );
  }

  void afficherCalendrier() async {
    final dateChoisie = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 365),
      ),
      lastDate: DateTime.now(),
    );
    if (dateChoisie != null) {
      setState(() {
        date = dateChoisie;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nouvelle Dépense',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(16 * 2),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('libele'),
                  ),
                  maxLength: 20,
                  controller: libeleControler,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date != null
                          ? formateur.format(date!)
                          : 'choisir une Date',
                    ),
                    const Gap(16),
                    IconButton(
                      onPressed: afficherCalendrier,
                      icon: const Icon(
                        Icons.date_range,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TextField(
            decoration: const InputDecoration(
              label: Text('montant'),
              prefix: Text('\$'),
            ),
            keyboardType: TextInputType.number,
            controller: montantControler,
          ),
          const Gap(10),
          Row(
            children: [
              DropdownButton(
                value: categorieChoisie,
                items: Categorie.values
                    .map(
                      (e) => DropdownMenuItem(
                        key: ValueKey(e),
                        value: e,
                        child: Text(
                          e.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      categorieChoisie = value;
                    });
                  }
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'ANNULER',
                ),
              ),
              ElevatedButton(
                onPressed: enregistrer,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'AJOUTER',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
