import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatDeDate = DateFormat.yMd();

const categorieIcons = {
  Categorie.loyer: Icons.attach_money_sharp,
  Categorie.vehicule: Icons.car_repair_sharp,
  Categorie.nourriture: Icons.food_bank_outlined,
  Categorie.scolarite: Icons.school_outlined,
  Categorie.vetement: Icons.shopping_bag_sharp,
  Categorie.maison: Icons.house_sharp,
};

enum Categorie {
  vehicule,
  nourriture,
  maison,
  loyer,
  scolarite,
  vetement,
}

class Depense {
  final String id;
  final double montant;
  final String libele;
  final DateTime date;
  final Categorie categorie;
  Depense({
    required this.montant,
    required this.libele,
    required this.date,
    required this.categorie,
  }) : id = uuid.v4();

  String get dateformatee {
    return formatDeDate.format(date);
  }
}
