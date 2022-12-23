import 'package:flutter/material.dart';

class PictureRow extends StatelessWidget {
  const PictureRow({
    Key? key,
    required this.imageUrlList,
  }) : super(key: key);

  final List imageUrlList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: imageUrlList.map((picData) {
        return Container(
          margin: const EdgeInsets.only(right: 3),
          width: 120,
          height: 80,
          child: Image.network(
            picData.pictureUrl!,
            fit: BoxFit.cover,
          ),
        );
      }).toList()),
    );
  }
}
