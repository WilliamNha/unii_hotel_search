import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

class NearbyTapWidget extends StatelessWidget {
  const NearbyTapWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.only(left: 15, right: 15),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.5)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Near by"),
          Icon(
            Icons.location_on,
            color: AppConstant.primaryColor,
            size: 30,
          )
        ],
      ),
    );
  }
}
