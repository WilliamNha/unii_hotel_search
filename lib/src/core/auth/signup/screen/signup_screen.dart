import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:unii_hotel_search/src/core/auth/login/controller/login_controller.dart';
import 'package:unii_hotel_search/src/core/auth/otp/controller/resend_otp_controller.dart';
import 'package:unii_hotel_search/src/core/auth/signup/controller/signup_controller.dart';
import 'package:unii_hotel_search/widgets/global/custom_appbar.dart';
import 'package:unii_hotel_search/widgets/global/custom_button.dart';
import 'package:unii_hotel_search/widgets/global/custom_textfield.dart';
import 'package:unii_hotel_search/widgets/global/custom_validate_text.dart';
import 'package:unii_hotel_search/widgets/global/instruction_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _singUpController = Get.put(SignUpController());
  final _loginController = Get.find<LoginController>();
  final _resendOtpController = Get.put(ResendOtpController());
  final _phoneController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  late String _countryDialCode;
  late String _countryShortName;
  @override
  void initState() {
    _countryShortName = _loginController.countryShortName.value;
    _phoneController.text = _loginController.phoneNumber.value;
    _countryDialCode = _loginController.countryCode.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(title: "Login / Sign Up"),
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
                      text: "Creating new account",
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //phone textfield
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 125,
                                child: CountryCodePicker(
                                  initialSelection: _countryShortName,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _countryDialCode = value.dialCode!;
                                      debugPrint(
                                          'country code: $_countryDialCode');
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                  // height: 100,
                                  width: 225,
                                  child: CustomTextfield(
                                    textInputType: TextInputType.phone,
                                    labelText: "Phone number",
                                    hintText: "Enter your phone number",
                                    controller: _phoneController,
                                  )),
                            ],
                          ),
                          //show validation text
                          _singUpController.isInvalidPhone.value
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: CustomValidateText(
                                    validateText:
                                        "Please enter validate phone number",
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10,
                          ),
                          //full name textfield
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: CustomTextfield(
                                  textInputType: TextInputType.phone,
                                  labelText: "Full name",
                                  hintText: "Enter your full name",
                                  controller: _fullnameController)),
                          _singUpController.isInvalidName.value
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: CustomValidateText(
                                    validateText: "Please enter your full name",
                                  ),
                                )
                              : const SizedBox(),
                          //email field
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: CustomTextfield(
                                  textInputType: TextInputType.phone,
                                  labelText: "Email",
                                  hintText: "Enter your email",
                                  controller: _emailController)),
                          _singUpController.isInvalidEmail.value
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: CustomValidateText(
                                    validateText:
                                        "Please enter a validate email",
                                  ),
                                )
                              : const SizedBox(),
                          //term and condition
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 30),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text:
                                                'By clicking the Sign Up button you accept to following',
                                            style: TextStyle(
                                                height: 1.5,
                                                fontSize: 16,
                                                color: Colors.black)),
                                        TextSpan(
                                            text: ' Terms of Use',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                debugPrint("hello");
                                              },
                                            style: const TextStyle(
                                                height: 1.5,
                                                fontSize: 16,
                                                color: AppConstant.primaryColor,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //accept and sign up button
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            child: CustomButton(
                                buttonText: "Accept and Sign Up",
                                onTap: () async {
                                  //check validation
                                  if (_phoneController.text.isEmpty ||
                                      _phoneController.text.length < 8) {
                                    _singUpController.isInvalidPhone.value =
                                        true;
                                  } else {
                                    _singUpController.isInvalidPhone.value =
                                        false;
                                  }
                                  if (_fullnameController.text.isEmpty ||
                                      _fullnameController.text.length < 3) {
                                    _singUpController.isInvalidName.value =
                                        true;
                                  } else {
                                    _singUpController.isInvalidName.value =
                                        false;
                                  }
                                  if (!_emailController.text.isEmail) {
                                    _singUpController.isInvalidEmail.value =
                                        true;
                                  } else {
                                    _singUpController.isInvalidEmail.value =
                                        false;
                                  }

                                  //call sign up function
                                  if (_singUpController.isInvalidPhone.value ==
                                          false &&
                                      _singUpController.isInvalidName.value ==
                                          false &&
                                      _singUpController.isInvalidEmail.value ==
                                          false) {
                                    await _singUpController.signUp(
                                        _phoneController.value.text,
                                        _countryDialCode,
                                        _fullnameController.value.text,
                                        _emailController.value.text);
                                    if (!mounted) return;
                                    FocusScope.of(context).unfocus();
                                    debugPrint(
                                        "sign up message : ${_singUpController.signupResponseModel.value.message}");
                                    if (_singUpController.signupResponseModel
                                            .value.message !=
                                        null) {
                                      if (!mounted) return;
                                      context.push('/otp');
                                      _phoneController.clear();
                                      _fullnameController.clear();
                                      _emailController.clear();
                                    } else {
                                      final snackBar = SnackBar(
                                        content: Text(_singUpController
                                            .signupErrorModel
                                            .value
                                            .phoneNumber![0]),
                                        action: SnackBarAction(
                                          label: 'OK',
                                          onPressed: () {},
                                        ),
                                      );
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
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
              _singUpController.isLoading.value ||
                      _resendOtpController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
