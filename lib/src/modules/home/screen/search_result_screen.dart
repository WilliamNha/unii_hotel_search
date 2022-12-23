import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:unii_hotel_search/src/modules/home/controller/hotel_search_controller.dart';
import 'package:unii_hotel_search/src/modules/home/model/hotel_location_model.dart';
import 'package:unii_hotel_search/widgets/global/custom_appbar.dart';
import 'package:unii_hotel_search/widgets/global/instruction_text.dart';
import 'package:unii_hotel_search/widgets/search_result/hotel_card_widget.dart';

class SearchResultScreen extends StatefulWidget {
  final HotelLocationModel hotelSearchModel;
  const SearchResultScreen({
    super.key,
    required this.hotelSearchModel,
  });

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final hotelSearchController = Get.put(HotelSearchController());
  @override
  void initState() {
    hotelSearchController.getHotelLocation(widget.hotelSearchModel.id!,
        widget.hotelSearchModel.longitude!, widget.hotelSearchModel.latitude!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          title: widget.hotelSearchModel.name!, isSearchResultScreen: true),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppConstant.backgroundColor,
          child: Obx(
            () => hotelSearchController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : hotelSearchController.hotelSearchList.isEmpty
                    ? const Center(child: Text("No hotel found"))
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InstructionText(
                                  text:
                                      "${hotelSearchController.hotelSearchList.length} properties found",
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 20, top: 5),
                                  child: FaIcon(
                                    FontAwesomeIcons.sliders,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                )
                              ],
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  hotelSearchController.hotelSearchList.length,
                              itemBuilder: (context, index) {
                                final hotelData = hotelSearchController
                                    .hotelSearchList[index];
                                return HotelCardWidget(
                                  onTap: () {
                                    context.push('/hotel_detail',
                                        extra: hotelData.hotelsId);
                                  },
                                  province: hotelData.province!,
                                  review: hotelData.reviews!,
                                  hotelImage: hotelData.imageCoverUrl!,
                                  hotelName: hotelData.hotelName!,
                                  distanceFromCity:
                                      hotelData.cityCenterDistance!,
                                  priceRange: hotelData.priceRange!,
                                  hotelSearchController: hotelSearchController,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
          )),
    );
  }
}
