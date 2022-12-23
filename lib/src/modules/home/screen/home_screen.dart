import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';
import 'package:unii_hotel_search/src/modules/home/controller/get_hotel_location_controller.dart';
import 'package:unii_hotel_search/src/modules/home/controller/log_out_controller.dart';
import 'package:unii_hotel_search/src/utils/helper/local_storage.dart';
import 'package:unii_hotel_search/widgets/global/custom_appbar.dart';
import 'package:unii_hotel_search/widgets/global/custom_button.dart';
import 'package:unii_hotel_search/widgets/global/instruction_text.dart';
import 'package:unii_hotel_search/widgets/home/check_in_out_header.dart';
import 'package:unii_hotel_search/widgets/home/chip_selection_widget.dart';
import 'package:unii_hotel_search/widgets/home/nearby_tap_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _logoutController = Get.put(LogoutController());
  final _homeController = Get.put(GetHotelLocationController());
  final _localStorage = LocalStorage();
  var chipList = ["Location", "Property Name"];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppbar(
            title: "Stays",
            isHasSignOutButton: true,
            onExitTap: () {
              debugPrint("exit app");
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title:
                      const Center(child: Text('Do you want to log out now?')),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstant.primaryColor,
                        ),
                        child: const Text('No')),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _logoutController.logut();
                        debugPrint(
                            "logout message : ${_logoutController.logoutModel.value.message}");
                        await _localStorage.storeApiKeyLocal("apiKey", "");

                        if (!mounted) return;
                        Navigator.pop(context);
                        context.go('/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstant.primaryColor,
                      ),
                      child: const Text('Yes'),
                    )
                  ],
                ),
              );
            }),
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
                          text: "Select find option and date",
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Text(
                                  "Find place to stay by:",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              SingleChildScrollView(
                                padding: const EdgeInsets.only(right: 20),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: chipList.asMap().entries.map((e) {
                                  return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentIndex = e.key;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 0, top: 15),
                                        child: CustomChip(
                                          isSelected: currentIndex == e.key,
                                          title: e.value,
                                          color: AppConstant.primaryColor,
                                        ),
                                      ));
                                }).toList()),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const NearbyTapWidget(),
                              const Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: CheckInOutHeader(),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                margin:
                                    const EdgeInsets.only(left: 15, right: 15),
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.5)),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("21-Dec-2022"),
                                    Icon(
                                      Icons.date_range,
                                      color: AppConstant.primaryColor,
                                      size: 30,
                                    ),
                                    Text("22-Dec-2022"),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 25, left: 15, right: 15, bottom: 20),
                                width: double.infinity,
                                child: CustomButton(
                                  buttonText: "Search",
                                  onTap: () async {
                                    await _homeController.getHotelLocation();
                                    if (_homeController
                                        .hotelLocationList.isNotEmpty) {
                                      if (!mounted) return;
                                      context.push('/location_selection');
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
                _homeController.isLoading.value ||
                        _logoutController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ));
  }
}
