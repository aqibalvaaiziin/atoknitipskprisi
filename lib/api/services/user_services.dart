import 'package:dio/dio.dart';
import 'package:mobile_app/api/config.dart';

class UserServices {
  // ignore: unnecessary_new
  static BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
  );

  static Dio dio = Dio(options);
  static Response? response;

  static Future loginUser({
    String? email,
    String? password,
  }) async {
    try {
      Map dataLogin = {"email": email, "password": password};
      response = await dio.post(
        '/login',
        data: dataLogin,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return response;
    } on DioError catch (ex) {
      // ignore: avoid_print
      print(ex.error.toString());
      if (ex.type == DioErrorType.response) {
      // ignore: avoid_print
        print("login form Error");
        if (ex.response!.statusCode == 404) {
      // ignore: avoid_print
          print("warning api");
        }
      } else if (ex.type == DioErrorType.response) {
      // ignore: avoid_print
        print("error default");
        throw Exception(ex.error.message);
      } else {
      // ignore: avoid_print
        print("timeout");
      }
    }
  }
}
