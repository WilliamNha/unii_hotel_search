import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:unii_hotel_search/src/core/auth/signup/model/signup_error_model.dart';
import 'package:unii_hotel_search/src/core/auth/signup/model/signup_response_model.dart';

class SignUpController extends GetxController {
  var signupResponseModel = SignupResponseModel().obs;
  var signupErrorModel = SignupErrorModel().obs;
  final phoneNumber = "".obs;
  final email = "".obs;
  final countryCode = "".obs;
  final fullName = "".obs;
  final isInvalidPhone = false.obs;
  final isInvalidName = false.obs;
  final isInvalidEmail = false.obs;

  final isLoading = false.obs;
  Future signUp(String phoneNumber, String countryCode, String fullname,
      String email) async {
    String url = "${AppConstant.baseUri}/signup";
    signupResponseModel = SignupResponseModel().obs;
    signupErrorModel = SignupErrorModel().obs;
    isLoading(true);
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Cotent-Language': 'en_US'
          },
          body: json.encode({
            'phone_number': phoneNumber,
            'country_code': countryCode,
            'name': fullname,
            'email': email,
          }));
      if (response.statusCode == 200) {
        debugPrint("respone: ${response.body}");
        var responseJson = json.decode(response.body);
        signupResponseModel.value = SignupResponseModel.fromJson(responseJson);
      } else {
        debugPrint("respone: ${response.body}");
        var responseJson = json.decode(response.body);
        signupErrorModel.value = SignupErrorModel.fromJson(responseJson);
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
