import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xffEDF6F4)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.favorite_border,
          color: AppConstant.primaryColor,
        ),
      ),
    );
  }
}
