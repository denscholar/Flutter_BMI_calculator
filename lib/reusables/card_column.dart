import 'package:flutter/material.dart';

class CardColumn extends StatelessWidget {
  final String label;
  final Image cardImage;

  const CardColumn({
    super.key,
    required this.label,
    required this.cardImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cardImage,
        const SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        )
      ],
    );
  }
}
