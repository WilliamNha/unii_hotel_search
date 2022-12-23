import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:unii_hotel_search/src/modules/home/model/hotel_detail_model.dart';
import 'package:unii_hotel_search/src/utils/helper/local_storage.dart';

class HotelDetailController extends GetxController {
  final isLoading = false.obs;
  final localStorage = LocalStorage();
  var hotelDetailModel = HotelDetailModel().obs;
  Future getHotelDetail(int hotelId) async {
    String apiKey = await localStorage.getApiKeyLocal("apiKey");
    debugPrint("api key: $apiKey");
    hotelDetailModel = HotelDetailModel().obs;
    String url =
        "${AppConstant.baseUri}/hotel/show/detail?hotels_id=$hotelId&channel=mobile&check_in_date=2022-05-19&check_out_date=2022-05-22";
    isLoading(true);
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Language': 'en_US',
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $apiKey"
        },
      );
      if (response.statusCode == 200) {
        // debugPrint("respone: ${response.body}");
        var responseJson = json.decode(response.body);
        hotelDetailModel.value = HotelDetailModel.fromJson(responseJson);
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
