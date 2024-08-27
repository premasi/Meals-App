import 'package:flutter/material.dart';

class MealsItemTraits extends StatelessWidget {
  const MealsItemTraits({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        )
      ],
    );
  }
}
