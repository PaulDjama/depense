// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GraphiqueItem extends StatelessWidget {
  final double fraction;
  final IconData icon;
  const GraphiqueItem({
    Key? key,
    required this.fraction,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //const Spacer(),
        Container(
          height: (177 * fraction) + 3,
          width: 40,
          color: Colors.deepPurple[300],
        ),
        const Gap(14),
        Icon(icon),
      ],
    );
  }
}
