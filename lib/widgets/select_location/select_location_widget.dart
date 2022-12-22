import 'package:flutter/material.dart';

class SelectLocationWidget extends StatelessWidget {
  const SelectLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xffEDF6F4),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: const Text('Select stay lcoation'),
    );
  }
}
