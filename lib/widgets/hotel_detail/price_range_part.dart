import 'package:flutter/material.dart';
import 'package:unii_hotel_search/widgets/global/favorite_button.dart';

import '../../src/constants/app_constants.dart';

class PriceRangePart extends StatelessWidget {
  final String priceRange;
  const PriceRangePart({
    Key? key,
    required this.priceRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price Range',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: AppConstant.primaryColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                priceRange,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          )),
          const SizedBox(
            width: 50,
            child: FavoriteButton(),
          )
        ],
      ),
    );
  }
}
