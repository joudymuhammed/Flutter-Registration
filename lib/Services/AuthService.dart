  import 'package:dio/dio.dart';

  class AuthService {
    static Dio dio = Dio();
    static Future<void> login(String email, String password) async {
      try {
        final response = await dio.post(
          'i dunnooo the api',
          data  : {'email': email, 'password': password},
        );
        if (response.statusCode == 200 && response.data['success'] == true) {
          print('Login successful');
        } else {
          print('Login failed: ${response.data['message']}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }

    static Future<void> signUp(String email, String password) async {
      try {
        final response = await dio.post(
          'el apiii',
          data: {'email': email, 'password': password},
        );
        if (response.statusCode == 200) {
          print('Sign-up successful');
        } else {
          print('Sign-up failed: ${response.data['message']}');
        }
      } catch (error) {
        print('Sign-up error: $error');
      }
    }
  }
