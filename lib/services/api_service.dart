import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  static const baseUrl = "https://dev-api.expatrio.com/";
  static var headers = {'Content-Type': 'application/json', 'Accept': '*/*'};

  static Future<Response> login(String email, String password) async {
    var response = await post(
      Uri.parse('${baseUrl}auth/login'),
      headers: headers,
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return response;
  }
}
