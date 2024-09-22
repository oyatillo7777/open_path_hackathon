import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_path_hackathon/bloc/create/create_bloc.dart';
import 'package:open_path_hackathon/bloc/login/login_bloc.dart';
import 'package:open_path_hackathon/screens/splash/splash_screen.dart';
import 'package:open_path_hackathon/tools/locator.dart';
import 'package:open_path_hackathon/tools/pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerApp();
  await PrefUtils().initInstance();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => CreateBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
        home: SplashScreen(),
      ),
    );
  }
}
