import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open_path_hackathon/model/login_model.dart';
import 'package:open_path_hackathon/tools/dio_conf.dart';

class TokenService {
  final Dio _dioConfig = DioConfig.getDio();

  Future<Either<String, AuthToken>> getToken(
      String username,
      String password,
      ) async {
    try {
      var data = FormData.fromMap({'username': username, 'password': password});

      Response response = await _dioConfig.post('token', data:data );
      if (response.statusCode == 200) {
        final authToken = AuthToken.fromJson(response.data);
        return right(authToken);
      } else {
        return left('Error: ${response.statusCode} ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 422) {
        return left('Invalid login credentials.');
      }
      return left('Request failed: ${e.message}');
    } catch (e) {
      return left('Unknown error: $e');
    }
  }
}
