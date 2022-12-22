import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:unii_hotel_search/src/core/auth/login/model/login_response_model.dart';

class LoginController extends GetxController {
  final countryCode = "".obs;
  final isInvalidatePhoneNumber = false.obs;
  final loginResponseModel = LoginResponseModel().obs;

  final phoneNumber = TextEditingController().obs;
  final isLoading = false.obs;
  Future verifyPhoneNumber(String phoneNumber, String countryCode) async {
    String url = "${AppConstant.baseUri}/mobile/check";
    isLoading(true);
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'phone_number': phoneNumber,
            'country_code': countryCode,
            'locale': 'lo',
          }));
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        debugPrint("responeJson: $responseJson");
        loginResponseModel.value = LoginResponseModel.fromJson(responseJson);
      } else {
        debugPrint("Error while fetching data");
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
