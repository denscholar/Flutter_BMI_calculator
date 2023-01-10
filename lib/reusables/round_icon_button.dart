import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Icon? icon;
  final VoidCallback? onPressed;
  const RoundedIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0XFF4C4F5E),
      onPressed: onPressed,
      child: icon,
    );
  }
}
