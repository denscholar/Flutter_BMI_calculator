import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? childCard;
  final VoidCallback? onPress;
  const ReusableCard(
      {super.key, required this.color, this.childCard, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.all(20.0),
        child: childCard,
      ),
    );
  }
}
