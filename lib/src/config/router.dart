import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unii_hotel_search/src/core/auth/login/screen/login_screen.dart';
import 'package:unii_hotel_search/src/core/auth/otp/screen/otp_screen.dart';
import 'package:unii_hotel_search/src/core/auth/signup/screen/signup_screen.dart';
import 'package:unii_hotel_search/src/core/auth/splash/screen/splash_screen.dart';
import 'package:unii_hotel_search/src/modules/home/model/hotel_location_model.dart';
import 'package:unii_hotel_search/src/modules/home/screen/home_screen.dart';
import 'package:unii_hotel_search/src/modules/home/screen/hotel_detail_screen.dart';
import 'package:unii_hotel_search/src/modules/home/screen/location_selection_screen.dart';
import 'package:unii_hotel_search/src/modules/home/screen/search_result_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/otp',
      builder: (BuildContext context, GoRouterState state) {
        return const OtpScreen();
      },
    ),
    GoRoute(
      path: '/location_selection',
      builder: (BuildContext context, GoRouterState state) {
        return const LocationSelectScreen();
      },
    ),
    GoRoute(
      path: '/search_result',
      builder: (BuildContext context, GoRouterState state) {
        return SearchResultScreen(
          hotelSearchModel: state.extra as HotelLocationModel,
        );
      },
    ),
    GoRoute(
      path: '/hotel_detail',
      builder: (BuildContext context, GoRouterState state) {
        return HotelDetailScreen(hotelId: state.extra as int);
      },
    ),
  ],
);
