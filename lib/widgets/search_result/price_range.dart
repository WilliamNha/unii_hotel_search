import 'package:flutter/material.dart';

class PriceRange extends StatelessWidget {
  final String priceRange;
  const PriceRange({
    required this.priceRange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      priceRange,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    );
  }
}
