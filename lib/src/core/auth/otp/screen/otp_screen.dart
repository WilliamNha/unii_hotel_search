import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:unii_hotel_search/src/core/auth/login/controller/login_controller.dart';
import 'package:unii_hotel_search/src/core/auth/otp/controller/otp_controller.dart';
import 'package:unii_hotel_search/src/utils/helper/local_storage.dart';
import 'package:unii_hotel_search/widgets/global/custom_appbar.dart';
import 'package:unii_hotel_search/widgets/global/custom_button.dart';
import 'package:unii_hotel_search/widgets/global/custom_textfield.dart';
import 'package:unii_hotel_search/widgets/global/instruction_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpTextEditingController = TextEditingController();
  final _loginController = Get.find<LoginController>();
  final _otpController = Get.put(OtpController());
  final localStorage = LocalStorage();
  final FocusNode focusNode = FocusNode();

  final sharePreference = SharedPreferences.getInstance();
  Timer? _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Obx(
              () => Stack(
                children: [
                  Container(
                      color: AppConstant.backgroundColor,
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const InstructionText(
                              text: "Phone number verification",
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                        'Enter OTP password sent to ${_loginController.countryCode.value}${_loginController.phoneNumber.value.text}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, bottom: 20),
                                    child: CustomTextfield(
                                        focusNode: focusNode,
                                        onChanged: (value) async {
                                          // if (value.length == 6) {
                                          //   focusNode.unfocus();
                                          //   await storeApiKeyLocal('apiKey',
                                          //       '7346cc0d-1881-4513-be4f-323f296681e3');
                                          //   if (!mounted) return;
                                          //   context.go('/home');
                                          // }

                                          if (value.length == 6) {
                                            focusNode.unfocus();
                                            _otpController.verifyOtpCode(
                                                _loginController
                                                    .phoneNumber.value.text,
                                                _loginController
                                                    .countryCode.value,
                                                otpTextEditingController.text);
                                            //if response is error show snackbar
                                            if (_otpController
                                                    .otpErrorModel.value.otp !=
                                                null) {
                                              final snackBar = SnackBar(
                                                content: Text(_otpController
                                                    .otpErrorModel
                                                    .value
                                                    .otp![0]),
                                                action: SnackBarAction(
                                                  label: 'OK',
                                                  onPressed: () {},
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            } else {
                                              await localStorage
                                                  .storeApiKeyLocal(
                                                      'apiKey',
                                                      _otpController
                                                          .otpResponseModel
                                                          .value
                                                          .apiKey!);

                                              //if response is success navigate to home screen
                                              if (!mounted) return;
                                              context.go('/home');
                                            }
                                          } else {}
                                        },
                                        hintText: "",
                                        labelText: "",
                                        controller: otpTextEditingController),
                                  ),
                                  const Text(
                                    'Did not receive OTP?',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    width: double.infinity,
                                    child: CustomButton(
                                        isDisable: _start == 0 ? false : true,
                                        buttonText: _start == 0
                                            ? "Request OTP"
                                            : "Retry in ${_start.toString()} sec",
                                        onTap: () async {
                                          await _loginController
                                              .verifyPhoneNumber(
                                                  _loginController
                                                      .phoneNumber.value.text,
                                                  _loginController
                                                      .countryCode.value);
                                        }),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ])),
                  _otpController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container()
                ],
              ),
            )));
  }
}
