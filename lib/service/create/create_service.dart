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
      dynamic passportImage,
      ) async {
    FormData data = FormData.fromMap({
      'fullname': fullname,
      'phone_number': phoneNumber,
      'username': username,
      'password': password,
      'passport_image': passportImage,
    });

    // Log the request data for debugging
    print('Request Data: ${data.fields}');

    try {
      Response response = await _dioConfig.post('student/register_student', data: data);

      print('Response: ${response.statusCode}, ${response.data}, ${response.headers}');

      if (response.statusCode == 200) {
        return right(response.data['message'] ?? 'Success');
      } else {
        return left('Error: ${response.statusCode} ${response.data}');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
