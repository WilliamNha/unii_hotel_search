import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/modules/home/controller/hotel_search_controller.dart';
import 'package:unii_hotel_search/widgets/search_result/hotel_info_widget.dart';

class HotelCardWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final int review;
  final String province;
  final String hotelImage;
  final String hotelName;
  final String distanceFromCity;
  final String priceRange;
  const HotelCardWidget({
    required this.onTap,
    required this.province,
    required this.review,
    required this.hotelImage,
    required this.hotelName,
    required this.distanceFromCity,
    required this.priceRange,
    Key? key,
    required this.hotelSearchController,
  }) : super(key: key);

  final HotelSearchController hotelSearchController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: Image.network(
                    hotelImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              HotelInfoWidget(
                provicne: province,
                hotelName: hotelName,
                distanceFromCity: distanceFromCity,
                priceRange: priceRange,
                review: 0,
              ),
            ],
          )),
    );
  }
}
