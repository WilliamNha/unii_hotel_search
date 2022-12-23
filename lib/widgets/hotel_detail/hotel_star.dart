import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

int starLength = 0;

class HotelStar extends StatelessWidget {
  final String starTotal;

  const HotelStar({
    required this.starTotal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    starLength = int.parse(starTotal.split('.')[0]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$starTotal Star",
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: AppConstant.primaryColor,
              fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (var i in List.generate(starLength, (index) => index))
              const Icon(
                Icons.star,
                color: Color(0xffFEC10A),
                size: 15,
              ),
            if (starLength < 5)
              for (var i in List.generate(5 - starLength, (index) => index))
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 15,
                )
          ],
        ),
      ],
    );
  }
}
