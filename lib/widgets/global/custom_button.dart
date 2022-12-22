import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final bool isDisable;
  final String buttonText;
  final GestureTapCallback onTap;
  const CustomButton({
    this.isDisable = false,
    required this.buttonText,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisable
          ? null
          : () {
              onTap();
            },
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor:
              isDisable ? const Color(0xffE0E0E0) : AppConstant.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
          textStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
      child: Text(buttonText,
          style: TextStyle(color: isDisable ? Colors.black38 : Colors.white)),
    );
  }
}
