import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:unii_hotel_search/src/constants/app_constants.dart';
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
  var phoneController = TextEditingController();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  String countryDialCode = "+66";
  @override
  void initState() {
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
                                  initialSelection: "TH",
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: true,
                                  onChanged: (value) {
                                    setState(() {
                                      countryDialCode = value.dialCode!;
                                      debugPrint(
                                          'country code: $countryDialCode');
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
                                    controller: phoneController,
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
                                  controller: fullnameController)),
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
                                  controller: emailController)),
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
                                  //assign value to controller variable
                                  _singUpController.countryCode.value =
                                      countryDialCode;
                                  _singUpController.phoneNumber.value =
                                      phoneController.value.text;
                                  _singUpController.fullName.value =
                                      fullnameController.value.text;
                                  _singUpController.email.value =
                                      emailController.value.text;

                                  //check validate
                                  if (_singUpController
                                          .phoneNumber.value.isEmpty ||
                                      _singUpController
                                              .phoneNumber.value.length <
                                          9) {
                                    _singUpController.isInvalidPhone.value =
                                        true;
                                  } else {
                                    _singUpController.isInvalidPhone.value =
                                        false;
                                  }
                                  if (_singUpController
                                          .fullName.value.isEmpty ||
                                      _singUpController.fullName.value.length <
                                          3) {
                                    _singUpController.isInvalidName.value =
                                        true;
                                  } else {
                                    _singUpController.isInvalidName.value =
                                        false;
                                  }
                                  if (!_singUpController.email.value.isEmail) {
                                    _singUpController.isInvalidEmail.value =
                                        true;
                                  } else {
                                    _singUpController.isInvalidEmail.value =
                                        false;
                                  }

                                  //call sign up
                                  if (_singUpController.isInvalidPhone.value ==
                                          false &&
                                      _singUpController.isInvalidName.value ==
                                          false &&
                                      _singUpController.isInvalidEmail.value ==
                                          false) {
                                    await _singUpController.signUp(
                                        _singUpController.phoneNumber.value,
                                        _singUpController.countryCode.value,
                                        _singUpController.fullName.value,
                                        _singUpController.email.value);

                                    if (!mounted) return;
                                    FocusScope.of(context).unfocus();

                                    if (_singUpController.signupErrorModel.value
                                            .phoneNumber ==
                                        null) {
                                      if (!mounted) return;
                                      context.push('/otp');
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
              _singUpController.isLoading.value
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
