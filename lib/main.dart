import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kantinmenu/app_colors.dart';
import 'package:kantinmenu/pages/listmenu.dart';

void main() {
  runApp(const KantinMenuApp());
}

class KantinMenuApp extends StatelessWidget {
  const KantinMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kedai Matcha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kantinGreen),
        scaffoldBackgroundColor: kantinPink,
        appBarTheme: const AppBarTheme(
          backgroundColor: kantinGreen,
          foregroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kantinGreen,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MenuListPage(),
    );
  }
}
