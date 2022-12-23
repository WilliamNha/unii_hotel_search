import 'package:flutter/material.dart';
import 'package:unii_hotel_search/widgets/hotel_detail/star_circle.dart';

class ScoreFaciliteisTitle extends StatelessWidget {
  const ScoreFaciliteisTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        StarCircleWidget(),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Socre / Top Facilities',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Icon(
          Icons.keyboard_arrow_right,
          size: 35,
          color: Color(0xff8C8C8C),
        ),
      ],
    );
  }
}
