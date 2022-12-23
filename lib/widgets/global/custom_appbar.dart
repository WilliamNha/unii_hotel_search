import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

customAppbar({
  String title = "Login / Sign Up",
  bool isSearchResultScreen = false,
}) {
  return AppBar(
    backgroundColor: AppConstant.primaryColor,
    title: isSearchResultScreen
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.location_on,
                  size: 20,
                ),
              ),
              Expanded(
                child: Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: isSearchResultScreen ? 16 : 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          )
        : Text(title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isSearchResultScreen ? 16 : 20,
              fontWeight: FontWeight.bold,
            )),
    actions: [
      isSearchResultScreen
          ? const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text('21/Dec - 22/Dec',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            )
          : const SizedBox(),
    ],
  );
}
