import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

class LocationWidgetCard extends StatelessWidget {
  final bool isNearbyLocation;
  final bool isFavoriteLocation;
  final String title;
  final String subTitle;
  const LocationWidgetCard({
    this.isNearbyLocation = false,
    this.isFavoriteLocation = false,
    required this.title,
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        child: Row(children: [
          isFavoriteLocation
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                )
              : isNearbyLocation
                  ? const Icon(
                      Icons.location_searching,
                      color: AppConstant.primaryColor,
                      size: 30,
                    )
                  : const Icon(
                      Icons.location_on,
                      color: Color(0xff8C8C8C),
                      size: 30,
                    ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 5),
                Text(
                  subTitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
