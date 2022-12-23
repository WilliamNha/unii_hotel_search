import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unii_hotel_search/main.dart';
import 'package:unii_hotel_search/src/constants/app_constants.dart';

import '../../../../utils/helper/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final localStorage = LocalStorage();
  getUserLoggedInStatus() async {
    await localStorage.getApiKeyLocal('apiKey').then((value) {
      debugPrint("value : $value");
      if (value.isNotEmpty) {
        isSignedIn = true;
      } else {
        isSignedIn = false;
      }
    });
  }

  @override
  void initState() {
    getUserLoggedInStatus();
    Future.delayed(const Duration(seconds: 3), () {
      isSignedIn == true ? context.go('/home') : context.go('/login');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppConstant.primaryColor,
        body: Center(
          child: Text(
            'Unii ',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
