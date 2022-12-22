import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

customAppbar({
  String title = "Login / Sign Up",
}) {
  return AppBar(
    backgroundColor: AppConstant.primaryColor,
    title: Text(title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
  );
}
