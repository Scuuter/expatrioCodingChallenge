import 'dart:convert';

import 'package:coding_challenge/services/auth_service.dart';
import 'package:http/http.dart';

class ApiService {
  static const baseUrl = "https://dev-api.expatrio.com/";

  final AuthService authService;

  ApiService({required this.authService});

  static Future<Response> login(String email, String password) async {
    var response = await post(
      Uri.parse('${baseUrl}auth/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return response;
  }
}
