import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:unii_hotel_search/src/core/auth/login/controller/login_controller.dart';
import 'package:unii_hotel_search/src/core/auth/otp/controller/otp_controller.dart';
import 'package:unii_hotel_search/src/core/auth/otp/controller/resend_otp_controller.dart';
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
  final _resendOtpController = Get.put(ResendOtpController());
  final otpTextEditingController = TextEditingController();
  final _loginController = Get.find<LoginController>();
  final _otpController = Get.put(OtpController());
  final localStorage = LocalStorage();
  final FocusNode focusNode = FocusNode();

  final sharePreference = SharedPreferences.getInstance();
  Timer? _timer;
  int _start = 120;

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
    debugPrint("phone : ${_loginController.phoneNumber.value}");
    debugPrint('country code: ${_loginController.countryCode.value}');

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
                                        'Enter OTP password sent to ${_loginController.countryCode.value}${_loginController.phoneNumber.value}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, bottom: 20),
                                    child: CustomTextfield(
                                        focusNode: focusNode,
                                        onChanged: (value) async {
                                          if (value.length == 6) {
                                            FocusScope.of(context).unfocus();
                                            await _otpController.verifyOtpCode(
                                                _loginController
                                                    .phoneNumber.value,
                                                _loginController
                                                    .countryCode.value,
                                                otpTextEditingController.text);
                                            otpTextEditingController.clear();
                                            //if response is error show snackbar
                                            if (_otpController.otpResponseModel
                                                    .value.apiKey !=
                                                null) {
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
                                            } else {
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
                                              if (!mounted) return;
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
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
                                          FocusScope.of(context).unfocus();
                                          final snackBar = SnackBar(
                                            content: Text(_resendOtpController
                                                .resendOtpModel.value.message!),
                                            action: SnackBarAction(
                                              label: 'OK',
                                              onPressed: () {},
                                            ),
                                          );
                                          if (!mounted) return;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          await _resendOtpController.resendOtp(
                                              _loginController
                                                  .phoneNumber.value,
                                              _loginController
                                                  .countryCode.value);
                                          setState(() {
                                            _start = 120;
                                          });
                                          startTimer();
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
