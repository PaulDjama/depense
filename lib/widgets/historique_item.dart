// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistoriqueItem extends StatelessWidget {
  final String libele;
  final double montant;
  final String texteDate;
  final IconData icone;
  const HistoriqueItem({
    Key? key,
    required this.libele,
    required this.montant,
    required this.texteDate,
    required this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            libele,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Gap(10),
          Row(
            children: [
              Text(
                '\$$montant',
              ),
              const Spacer(),
              Icon(icone),
              const Gap(8),
              Text(texteDate),
            ],
          ),
        ],
      ),
    );
  }
}
