import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/util.dart';

class ErrorInfo extends StatelessWidget {
  final Color color;
  const ErrorInfo({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final labelColor =
        Util.isDark(color) ? Colors.white : Util.darken(color, 0.4);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(height: 20),
          Image.asset('assets/rick_and_morty_surprised.png', width: 200),
          SizedBox(height: 10),
          Text(
            "Rick está causando fallas dimensionales; le pediremos a Morty que lo ayude.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: labelColor),
          ),
        ],
      ),
    );
  }
}
