import 'package:flutter/material.dart';
import '../models/Icon.dart';

class GridItem extends StatelessWidget {
  final IconData icon;
  final String lable;
  final Color color;

  const GridItem({
    required this.icon,
    required this.lable,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blueGrey),
          const SizedBox(height: 10),
          const Spacer(),
          Text(
            lable,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
