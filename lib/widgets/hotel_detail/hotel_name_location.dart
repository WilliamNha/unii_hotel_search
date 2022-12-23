import 'package:flutter/material.dart';

class HotelNameLocation extends StatelessWidget {
  const HotelNameLocation({
    Key? key,
    required this.location,
    required this.hotelName,
  }) : super(key: key);

  final String hotelName;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotelName,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          location,
          style: const TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ],
    );
  }
}
