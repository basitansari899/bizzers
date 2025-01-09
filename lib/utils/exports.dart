import 'package:faker_dart/faker_dart.dart';
export 'package:faker_dart/faker_dart.dart';
export 'colors.dart';
export 'assets.dart';
export 'app_theme.dart';
export 'package:flutter/material.dart';
export '../screens/user/splash.dart';
export '../screens/user/welecome_page.dart';
export '../screens/user/boarding_screen.dart';
export 'package:get/get.dart';

String getImage(h, w) {
  return Faker.instance.image.image(width: w, height: h);
}
