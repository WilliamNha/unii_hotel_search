import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:unii_hotel_search/widgets/global/custom_appbar.dart';
import 'package:unii_hotel_search/widgets/hotel_detail/hotel_name_location.dart';
import 'package:unii_hotel_search/widgets/hotel_detail/hotel_star.dart';
import 'package:unii_hotel_search/widgets/hotel_detail/image_background.dart';
import 'package:unii_hotel_search/widgets/hotel_detail/picture_row.dart';
import 'package:unii_hotel_search/widgets/hotel_detail/price_range_part.dart';
import 'package:unii_hotel_search/widgets/hotel_detail/score_faciliteis_title.dart';

import '../controller/hotel_detail_controller.dart';

class HotelDetailScreen extends StatefulWidget {
  final int? hotelId;
  const HotelDetailScreen({
    super.key,
    this.hotelId,
  });

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  final _hotelDetailController = Get.put(HotelDetailController());
  @override
  void initState() {
    debugPrint("hotel id: ${widget.hotelId}");
    _hotelDetailController.getHotelDetail(widget.hotelId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _hotelDetailController.isLoading.value
            ? customAppbar(title: '')
            : customAppbar(
                title:
                    "${_hotelDetailController.hotelDetailModel.value.hotelName}"),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppConstant.backgroundColor,
          child: _hotelDetailController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ImageBackground(
                          imageUrl: _hotelDetailController
                              .hotelDetailModel.value.imageCoverUrl!),
                      const SizedBox(
                        height: 3,
                      ),
                      _hotelDetailController
                              .hotelDetailModel.value.pictures!.isNotEmpty
                          ? PictureRow(
                              imageUrlList: _hotelDetailController
                                  .hotelDetailModel.value.pictures!)
                          : const SizedBox(),
                      // hotel name and star part
                      Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: HotelNameLocation(
                                  hotelName: _hotelDetailController
                                      .hotelDetailModel.value.hotelName!,
                                  location: _hotelDetailController
                                      .hotelDetailModel.value.provinceName!),
                            ),
                            Expanded(
                              child: HotelStar(
                                starTotal: _hotelDetailController
                                    .hotelDetailModel.value.starHotel!,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      //price range part
                      PriceRangePart(
                        priceRange: _hotelDetailController
                            .hotelDetailModel.value.priceRange!,
                      ),
                      //check in check out part
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Check-in',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '21/Dec',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppConstant.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppConstant.primaryColor,
                                    size: 30,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Check-in',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '21/Dec',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppConstant.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: AppConstant.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Select Rooms',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      // score and facilities part
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ScoreFaciliteisTitle(),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Popularity Score',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppConstant.primaryColor),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        '0.0',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Row(
                                        children: [
                                          for (var i in List.generate(
                                              5, (index) => index))
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                size: 16,
                                              ),
                                            )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (var i in _hotelDetailController
                                          .hotelDetailModel
                                          .value
                                          .popularFacilities!)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Icon(Icons.check),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                " ${i.caption}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
