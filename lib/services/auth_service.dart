import 'dart:convert';

import 'package:coding_challenge/models/user.dart';
import 'package:coding_challenge/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = const FlutterSecureStorage();
  User? user;
  String? accessToken;

  Future<User?> login(String email, String password) async {
    var userData = await storage.read(key: 'user');
    if (userData != null) {
      user = User.fromJson(jsonDecode(userData));
      //todo: change logic if token can be refreshed
      accessToken = await storage.read(key: 'accessToken');
      if (accessToken != null) {
        return user;
      }
    }

    var response = await ApiService.login(email, password);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      user = User.fromJson(responseData['subject']);
      accessToken = responseData['accessToken'];
      storage.write(key: 'accessToken', value: accessToken);
      storage.write(key: 'user', value: jsonEncode(user?.toJson()));
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }
    return user;
  }
}
