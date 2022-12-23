import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

class ReviewButton extends StatelessWidget {
  const ReviewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
      ),
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xffEDF6F4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.comment_outlined,
              color: AppConstant.primaryColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '0 Reviews',
            ),
          ),
        ],
      ),
    );
  }
}
