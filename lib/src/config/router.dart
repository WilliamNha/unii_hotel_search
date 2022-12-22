import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unii_hotel_search/src/core/auth/login/screen/login_screen.dart';
import 'package:unii_hotel_search/src/core/auth/otp/screen/otp_screen.dart';
import 'package:unii_hotel_search/src/core/auth/register/screen/register_screen.dart';
import 'package:unii_hotel_search/src/modules/home/screen/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/login",
  routes: <GoRoute>[
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
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
  ],
);
