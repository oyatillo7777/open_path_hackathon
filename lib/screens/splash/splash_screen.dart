import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_path_hackathon/screens/main/main_screen.dart';
import 'package:open_path_hackathon/tools/locator.dart';
import 'package:open_path_hackathon/tools/pref.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    if (mounted) {
      Timer(const Duration(seconds: 2), () {
        if (kDebugMode) {
          print(getIt.get<PrefUtils>().getToken());
        }
        Get.offAll(
          getIt.get<PrefUtils>().getToken().isNotEmpty
              ? const HomePage()
              : const LoginScreen(),
        );
      });
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
