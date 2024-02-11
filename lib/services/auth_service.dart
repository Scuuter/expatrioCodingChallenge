import 'dart:convert';

import 'package:coding_challenge/models/user.dart';
import 'package:coding_challenge/services/api_service.dart';
import 'package:coding_challenge/services/storage_service.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final storage = StorageService();
  User? user;
  String? accessToken;

  Future<User?> login(String email, String password) async {
    if (user != null) {
      return user;
    }
    user = await storage.readUser();
    if (user != null) {
      accessToken = await storage.readAccessToken();
      return user;
    }

    var response = await ApiService.login(email, password);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      user = User.fromJson(responseData['subject']);
      accessToken = responseData['accessToken'];
      //todo: check errors
      storage.writeAccessToken(accessToken!);
      storage.writeUser(user!);
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }
    return user;
  }
}
