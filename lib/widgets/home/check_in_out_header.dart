import 'package:flutter/material.dart';

class CheckInOutHeader extends StatelessWidget {
  const CheckInOutHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            "Check-in Date",
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ),
        Text(
          "(1 night)",
          style: TextStyle(fontSize: 13, color: Colors.black54),
        ),
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: Text(
            "Check-out Date",
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
