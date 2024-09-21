import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:open_path_hackathon/bloc/login/login_bloc.dart';
import 'package:open_path_hackathon/screens/splash/splash_screen.dart';
import 'package:open_path_hackathon/tools/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  late SharedPreferences prefs;

  Future<bool> initInstance() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  String getToken() {
    return prefs.getString(AppConstants.token) ?? '';
  }

  Future<bool> saveToken(String token) async {
    return await prefs.setString(AppConstants.token, token);
  }

  Future<void> clearAll(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    Get.offAll(const SplashScreen());
    context.read<LoginBloc>().add(const LoginEvent.reset());
    return;
  }
}
