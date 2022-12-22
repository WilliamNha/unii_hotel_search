import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String)? onChanged;
  const SearchField({
    required this.textEditingController,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: TextField(
          onChanged: onChanged,
          decoration: const InputDecoration(
            hintText: 'Search...',
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
          ),
        ));
  }
}
