
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sponsor/utilis/routes.dart';
import 'presentation/home/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.loginRoute,
      builder: EasyLoading.init(),
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
    );
  }
}