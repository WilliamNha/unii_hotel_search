import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:unii_hotel_search/src/core/auth/login/controller/login_controller.dart';
import 'package:unii_hotel_search/src/core/auth/otp/controller/resend_otp_controller.dart';
import 'package:unii_hotel_search/widgets/global/custom_appbar.dart';
import 'package:unii_hotel_search/widgets/global/custom_button.dart';
import 'package:unii_hotel_search/widgets/global/custom_textfield.dart';
import 'package:unii_hotel_search/widgets/global/custom_validate_text.dart';
import 'package:unii_hotel_search/widgets/global/instruction_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final _resendOtpController = Get.put(ResendOtpController());
  final phoneNumebrTextEditingController = TextEditingController();
  String? _countryShortName = "TH";
  final formKey = GlobalKey<FormState>();
  String _dialCode = "+66";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InstructionText(
                      text: "Enter your phone number",
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 125,
                                child: CountryCodePicker(
                                  initialSelection: "TH",
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _countryShortName = value.code;
                                      _dialCode = value.dialCode!;
                                    });
                                  },
                                ),
                              ),
                              Form(
                                key: formKey,
                                child: SizedBox(
                                    height: 100,
                                    width: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: CustomTextfield(
                                        textInputType: TextInputType.phone,
                                        labelText: "Phone number",
                                        hintText: "Enter your phone number",
                                        controller:
                                            phoneNumebrTextEditingController,
                                        // loginController.phoneNumber.value,
                                      ),
                                    )),
                              )
                            ],
                          ),
                          //show validation text
                          loginController.isInvalidatePhoneNumber.value
                              ? const Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: CustomValidateText(
                                    validateText:
                                        "Please enter validate phone number",
                                  ),
                                )
                              : const SizedBox(),

                          //next button
                          Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            width: double.infinity,
                            child: CustomButton(
                                buttonText: "Next",
                                onTap: () async {
                                  loginController.countryShortName.value =
                                      _countryShortName!;
                                  loginController.phoneNumber.value =
                                      phoneNumebrTextEditingController.text;
                                  if (loginController
                                          .phoneNumber.value.isEmpty ||
                                      loginController.phoneNumber.value.length <
                                          8) {
                                    loginController
                                        .isInvalidatePhoneNumber.value = true;
                                  } else {
                                    loginController
                                        .isInvalidatePhoneNumber.value = false;
                                    loginController.countryCode.value =
                                        _dialCode;

                                    await loginController.verifyPhoneNumber(
                                        loginController.phoneNumber.value,
                                        _dialCode);
                                    phoneNumebrTextEditingController.clear();

                                    if (loginController
                                            .loginResponseModel.value.route ==
                                        "/otp") {
                                      await _resendOtpController.resendOtp(
                                          loginController.phoneNumber.value,
                                          loginController.countryCode.value);
                                      if (!mounted) return;
                                      context.push('/otp');
                                    } else if (loginController
                                            .loginResponseModel.value.route ==
                                        "/signup") {
                                      if (!mounted) return;
                                      context.push('/signup');
                                    }
                                  }
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (loginController.isLoading.value ||
                  _resendOtpController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
