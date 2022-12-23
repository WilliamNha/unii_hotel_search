import 'package:flutter/material.dart';

class StarCircleWidget extends StatelessWidget {
  const StarCircleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff8C8C8C), width: 3),
          color: Colors.white,
          shape: BoxShape.circle),
      child: const Center(
        child: Icon(
          Icons.star,
          color: Color(0xff8C8C8C),
          size: 20,
        ),
      ),
    );
  }
}
