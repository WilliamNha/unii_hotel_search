import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:unii_hotel_search/src/modules/home/model/log_out_model.dart';
import 'package:unii_hotel_search/src/utils/helper/local_storage.dart';

class LogoutController extends GetxController {
  final isLoading = false.obs;
  var logoutModel = LogoutModel().obs;
  final localStorage = LocalStorage();
  Future logut() async {
    isLoading(true);
    String url = "${AppConstant.baseUri}/logout";
    String apiKey = await localStorage.getApiKeyLocal("apiKey");
    logoutModel = LogoutModel().obs;
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            HttpHeaders.authorizationHeader: "Bearer $apiKey",
          },
          body: json.encode({}));
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        debugPrint("responeJson: $responseJson");
        logoutModel.value = LogoutModel.fromJson(responseJson);
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
