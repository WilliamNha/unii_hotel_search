import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:unii_hotel_search/src/modules/home/model/hotel_search_model.dart';

class HotelSearchController extends GetxController {
  final isLoading = false.obs;
  var hotelSearchModel = HotelSearchModel().obs;
  final hotelSearchList = <HotelSearchModel>[].obs;
  Future getHotelLocation(
      int provinceId, String longitude, String latitude) async {
    hotelSearchModel = HotelSearchModel().obs;
    hotelSearchList.clear();
    String url =
        "${AppConstant.baseUri}/hotel/searching?latitude=$latitude&longitude=$longitude&provinces_id=$provinceId&channel=mobile&check_in_date=2022-05-24&check_out_date=2022-05-31&sdfsdf=sdf";
    isLoading(true);

    try {
      var response = await http.get(
        Uri.parse(
          url,
        ),
        headers: {
          'Content-Language': 'en_US',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        // debugPrint("respone: ${response.body}");
        var responseJson = json.decode(response.body)['data'];

        responseJson.map((data) {
          hotelSearchList.add(HotelSearchModel.fromJson(data));
        }).toList();
      } else {
        debugPrint("respone: ${response.body}");
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
