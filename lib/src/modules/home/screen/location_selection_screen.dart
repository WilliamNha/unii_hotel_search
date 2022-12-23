import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:unii_hotel_search/src/modules/home/controller/get_hotel_location_controller.dart';
import 'package:unii_hotel_search/src/modules/home/controller/hotel_search_controller.dart';
import 'package:unii_hotel_search/widgets/global/custom_appbar.dart';
import 'package:unii_hotel_search/widgets/select_location/location_widget_card.dart';
import 'package:unii_hotel_search/widgets/select_location/search_filed.dart';

import '../../../../widgets/select_location/select_location_widget.dart';

class LocationSelectScreen extends StatefulWidget {
  const LocationSelectScreen({super.key});

  @override
  State<LocationSelectScreen> createState() => _LocationSelectScreenState();
}

class _LocationSelectScreenState extends State<LocationSelectScreen> {
  final getHotelLocationController = Get.find<GetHotelLocationController>();
  final hotelSearchController = Get.put(HotelSearchController);
  final _searchController = TextEditingController();
  var locationList = [];
  @override
  void initState() {
    locationList = getHotelLocationController.hotelLocationList;
    // debugPrint("location list: ${locationList[0].longitude}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(title: "Stays"),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SelectLocationWidget(),
                      SearchField(
                        textEditingController: _searchController,
                        onChanged: searchLocation,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: locationList.length,
                        itemBuilder: (context, index) {
                          return LocationWidgetCard(
                            onTap: () {
                              context.push('/search_result',
                                  extra: locationList[index]);
                            },
                            isNearbyLocation: index == 0,
                            isFavoriteLocation: index == 1,
                            title: locationList[index].name!,
                            subTitle: locationList[index].country!,
                          );
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }

  void searchLocation(String value) {
    final searchedLocationList =
        getHotelLocationController.hotelLocationList.where((locatioName) {
      final locationName = locatioName.name!.toLowerCase();
      final input = value.toLowerCase();

      return locationName.contains(input);
    }).toList();
    setState(() {
      locationList = searchedLocationList;
    });
  }
}
