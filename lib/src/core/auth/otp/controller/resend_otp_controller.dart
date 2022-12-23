import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:unii_hotel_search/src/core/auth/otp/model/resend_otp_model.dart';

class ResendOtpController extends GetxController {
  final otpCode = "".obs;
  var resendOtpModel = ResendOtpModel().obs;

  final isLoading = false.obs;
  Future resendOtp(
    String phoneNumber,
    String countryCode,
  ) async {
    String url = "${AppConstant.baseUri}/otp/resend?time=12312";
    resendOtpModel = ResendOtpModel().obs;

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
          }));
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        resendOtpModel.value = ResendOtpModel.fromJson(responseJson);
        debugPrint("responeJson: $responseJson");
      } else {
        debugPrint("Error: ${response.body}");
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
