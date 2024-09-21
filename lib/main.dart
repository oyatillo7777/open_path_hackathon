import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_path_hackathon/screens/homework/homework.dart';
import 'package:open_path_hackathon/screens/main/main_screen.dart';
import 'package:open_path_hackathon/screens/splash/splash_screen.dart';
import 'package:open_path_hackathon/tools/locator.dart';
import 'package:open_path_hackathon/tools/pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerApp();
  await PrefUtils().initInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      child: GetMaterialApp(
        home: HomeworkScreen(),
      ),
    );
  }
}
