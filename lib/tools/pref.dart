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
}
