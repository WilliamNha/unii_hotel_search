import 'package:flutter/material.dart';

class CustomValidateText extends StatelessWidget {
  final String validateText;
  const CustomValidateText({
    required this.validateText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: Text(
            validateText,
            style: const TextStyle(color: Colors.red),
          ),
        ));
  }
}
