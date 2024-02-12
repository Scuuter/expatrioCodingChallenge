import 'dart:convert';

import 'package:coding_challenge/services/singletons/auth_service.dart';
import 'package:flutter/foundation.dart';
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
    if (kDebugMode) {
      print(response.body);
    }
    return response;
  }

  Future<Response> getTaxData() async {
    var user = authService.user;

    var response = await get(
      Uri.parse('${baseUrl}v3/customers/${user?.id}/tax-data'),
      headers: {
        'Authorization': 'Bearer ${authService.accessToken?.token}',
        'Accept': '*/*',
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
    return response;
  }
}
