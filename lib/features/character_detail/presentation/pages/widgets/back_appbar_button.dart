import 'package:flutter/material.dart';

class BackAppBarButton extends StatelessWidget {
  const BackAppBarButton({super.key, required this.darkenColor});

  final Color darkenColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 24,
        height: 24,
        margin: EdgeInsets.only(left: 16, top: 10),
        decoration: BoxDecoration(
          color: darkenColor.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Transform.translate(
          offset: Offset(-4, -2),
          child: Icon(
            Icons.chevron_left_rounded,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
