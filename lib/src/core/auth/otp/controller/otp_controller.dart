import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:unii_hotel_search/src/core/auth/otp/model/otp_error_model.dart';
import 'package:unii_hotel_search/src/core/auth/otp/model/otp_response_model.dart';

class OtpController extends GetxController {
  final otpCode = "".obs;
  var otpResponseModel = OtpResponseModel().obs;
  var otpErrorModel = OtpErrorModel().obs;
  final isLoading = false.obs;
  Future verifyOtpCode(
      String phoneNumber, String countryCode, String otp) async {
    String url = "${AppConstant.baseUri}/otp/verify";
    otpResponseModel = OtpResponseModel().obs;
    otpErrorModel = OtpErrorModel().obs;
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
            'otp': otp,
          }));
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        debugPrint("responeJson: $responseJson");
        otpResponseModel.value = OtpResponseModel.fromJson(responseJson);
      } else {
        var responseJson = json.decode(response.body);
        otpErrorModel.value = OtpErrorModel.fromJson(responseJson);
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}

const snackBar = SnackBar(
  content: Text('Yay! A SnackBar!'),
);
