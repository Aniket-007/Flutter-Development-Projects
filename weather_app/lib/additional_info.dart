import 'package:flutter/material.dart';

class AdditionalInformationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInformationItem({super.key,
  required this.icon,
  required this.label,
  required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(icon),
        const SizedBox(height: 8),
        Text(label),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}
