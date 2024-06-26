import 'package:biometric/biometric.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:models/models.dart';
import 'package:settings/settings.dart';

import '../di/service_locator.dart';
import 'middlewares/auth_middleware.dart';

final pages = [
  GetPage(
    name: Routes.home.path,
    // This will be triggered everytime we want to get the home page
    middlewares: [AuthMiddleware(locator.get<AuthManager>())],
    transition: Transition.fade,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
    binding: HomeBinding(),
    page: () => HomePage(),
  ),
  GetPage(
    name: Routes.login.path,
    transition: Transition.fade,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
    binding: LoginBinding(),
    page: () => LoginPage(),
  ),
  GetPage(
    name: Routes.biometric.path,
    transition: Transition.fade,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
    binding: BiometricBinding(),
    page: () => BiometricPage(),
  ),
  GetPage(
    name: Routes.settings.path,
    transition: Transition.rightToLeft,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
    binding: SettingsBinding(),
    page: () => SettingsPage(),
  ),
];
