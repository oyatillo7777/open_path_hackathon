import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open_path_hackathon/tools/dio_conf.dart';

class CreateService {
  final Dio _dioConfig = DioConfig.getDio();

  Future<Either<String, String>> postCreate(
    String fullname,
    String phoneNumber,
    String username,
    String password,
    String passportImage,
  ) async {
    var data = FormData.fromMap({
      'fullname': fullname,
      'phone_number': phoneNumber,
      'username': username,
      'password': password,
      'passport_image': passportImage,
    });
    try {
      Response response =
          await _dioConfig.post('student/register_student', data: data);
      if (response.statusCode == 200) {
        return right(response.statusMessage ?? '');
      } else {
        return left('xatolik');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
