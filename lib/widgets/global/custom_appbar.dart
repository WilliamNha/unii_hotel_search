import 'package:flutter/material.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

customAppbar(
    {String title = "Login / Sign Up",
    bool isSearchResultScreen = false,
    bool isHasSignOutButton = false,
    Function? onExitTap}) {
  return AppBar(
    backgroundColor: AppConstant.primaryColor,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[Color(0xff259EA6), Color(0xff153356)],
        ),
      ),
    ),
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
      isHasSignOutButton
          ? GestureDetector(
              onTap: () {
                onExitTap!();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
              ),
            )
          : const SizedBox(),
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
