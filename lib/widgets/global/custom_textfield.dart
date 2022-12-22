import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final bool? isEmailField;
  final bool? isPhoneNumField;
  final bool? isFullNameField;
  final String labelText;
  final String hintText;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  const CustomTextfield({
    this.focusNode,
    this.onChanged,
    this.textInputType = TextInputType.text,
    required this.hintText,
    required this.labelText,
    this.isFullNameField,
    this.isPhoneNumField,
    this.isEmailField,
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  final FocusNode _focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      child: TextFormField(
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppConstant.primaryColor, width: 2.0),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
            hintStyle: const TextStyle(
              fontSize: 15,
            ),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: _focus.hasFocus ? FontWeight.bold : FontWeight.normal,
              color: _focus.hasFocus ? AppConstant.primaryColor : Colors.black,
            ),
            labelText: widget.labelText,
            hintText: widget.hintText),
      ),
    );
  }
}
