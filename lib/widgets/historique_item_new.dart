// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HistoriqueItemNew extends StatelessWidget {
  final String libele;
  final double montant;
  final String texteDate;
  final IconData icone;
  const HistoriqueItemNew({
    Key? key,
    required this.libele,
    required this.montant,
    required this.texteDate,
    required this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.deepPurple[900],
        radius: 30,
        child: Icon(icone),
      ),
      title: Text(
        libele,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      trailing: CircleAvatar(
          backgroundColor: Colors.deepPurple[900],
          radius: 13,
          child: const Text('2') //Icon(icone),
          ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            Text(
              '\$$montant',
            ),
            const Spacer(),
            Text(texteDate),
          ],
        ),
      ),
      onTap: () {},
    );

    // Card(
    //   color: Colors.grey[300],
    //   elevation: 0,
    //   child: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           libele,
    //           style: const TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //           ),
    //         ),
    //         const Gap(10),
    //         Row(
    //           children: [
    //             Text(
    //               '\$$montant',
    //             ),
    //             const Spacer(),
    //             Icon(icone),
    //             const Gap(8),
    //             Text(texteDate),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
