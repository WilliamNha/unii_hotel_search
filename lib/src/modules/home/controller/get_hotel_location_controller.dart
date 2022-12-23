import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:unii_hotel_search/src/modules/home/model/hotel_location_model.dart';
import 'package:unii_hotel_search/src/utils/helper/local_storage.dart';

class GetHotelLocationController extends GetxController {
  final isLoading = false.obs;
  final localStorage = LocalStorage();
  var hotelLocationModel = HotelLocationModel().obs;
  var hotelLocationList = <HotelLocationModel>[].obs;
  String longtitude = '12345';
  String latitude = '12345';
  Future getHotelLocation() async {
    String apiKey = await localStorage.getApiKeyLocal("apiKey");
    debugPrint("api key: $apiKey");
    hotelLocationModel = HotelLocationModel().obs;
    String url =
        "${AppConstant.baseUri}/hotel/location?longitude=$longtitude&latitude=$latitude";

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
        var responseJson = json.decode(response.body)['data'];
        hotelLocationList.clear();
        responseJson.map((data) {
          hotelLocationList.add(HotelLocationModel.fromJson(data));
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
