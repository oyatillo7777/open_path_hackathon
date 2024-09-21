import 'package:dio/dio.dart';
import 'package:open_path_hackathon/tools/locator.dart';
import 'package:open_path_hackathon/tools/pref.dart';
import 'package:open_path_hackathon/tools/url.dart';

class DioConfig {
  static Dio? _dio;

  static Dio getDio() {
    _dio ??= Dio()
      ..options = BaseOptions(
        baseUrl: AppConstants.token,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 300),
        contentType: Headers.jsonContentType,
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, handle) async {
            String token = await getIt<PrefUtils>().getToken();
            options.headers['Authorization'] = "Bearer $token";
            return handle.next(options);
          },
          onError: (DioException e, ErrorInterceptorHandler handle) {
            return handle.next(e);
          },
        ),
      );
    return _dio!;
  }
}
