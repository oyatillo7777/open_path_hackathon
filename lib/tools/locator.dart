import 'package:get_it/get_it.dart';
import 'package:open_path_hackathon/tools/pref.dart';

final getIt = GetIt.instance;

Future<void> registerApp() async {
  final prefUtils = PrefUtils();
  await prefUtils.initInstance();
  getIt.registerSingleton(prefUtils);
}
