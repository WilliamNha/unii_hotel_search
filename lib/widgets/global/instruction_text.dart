import 'package:flutter/material.dart';

class InstructionText extends StatelessWidget {
  final String text;
  const InstructionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Text(text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
