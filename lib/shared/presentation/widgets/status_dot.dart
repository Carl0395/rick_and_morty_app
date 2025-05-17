import 'package:flutter/material.dart';

class StatusDot extends StatelessWidget {
  final String status;
  const StatusDot({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:
            status == 'Alive'
                ? Colors.green
                : status == 'Dead'
                ? Colors.red
                : Colors.grey,
      ),
    );
  }
}
