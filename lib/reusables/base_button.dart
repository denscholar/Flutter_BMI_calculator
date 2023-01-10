import 'package:flutter/material.dart';

import '../constants.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;

  const BaseButton({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: const EdgeInsets.only(top: 10.0),
        child: Center(child: Text(label, style: kLargeTextStyle)),
      ),
    );
  }
}
