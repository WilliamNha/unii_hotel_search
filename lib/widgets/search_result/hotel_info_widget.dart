import 'package:flutter/material.dart';
import 'package:unii_hotel_search/widgets/global/favorite_button.dart';
import 'package:unii_hotel_search/widgets/search_result/price_range.dart';
import 'package:unii_hotel_search/widgets/search_result/review_button.dart';

class HotelInfoWidget extends StatelessWidget {
  final String provicne;
  final String hotelName;
  final String distanceFromCity;
  final String priceRange;
  final int review;
  const HotelInfoWidget({
    required this.provicne,
    required this.hotelName,
    required this.distanceFromCity,
    required this.priceRange,
    required this.review,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hotelName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$provicne - $distanceFromCity',
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //fav button
                  const FavoriteButton(),
                  const ReviewButton(),
                  const Spacer(),
                  SizedBox(
                    width: 135,
                    // color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: PriceRange(
                        priceRange: priceRange,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
