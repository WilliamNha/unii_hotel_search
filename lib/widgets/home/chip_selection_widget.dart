import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

class CustomChip extends StatefulWidget {
  final String? title;
  final Color? color;
  final bool isSelected;
  final int? selectIndex;
  final GestureTapCallback? onTap;
  const CustomChip(
      {Key? key,
      this.title,
      this.color,
      this.onTap,
      this.selectIndex,
      this.isSelected = false})
      : super(key: key);

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      height: 40,
      // width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.isSelected ? AppConstant.primaryColor : Colors.white,
          border: Border.all(color: AppConstant.primaryColor, width: 1)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.isSelected
              ? const Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.white,
                )
              : const SizedBox(),
          const SizedBox(
            width: 5,
          ),
          Text(
            '${widget.title}',
            style: TextStyle(
              color:
                  widget.isSelected ? Colors.white : AppConstant.primaryColor,
            ),
          ),
        ],
      )),
    );
  }
}
