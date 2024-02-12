import 'dart:convert';

import 'package:coding_challenge/models/access_token.dart';
import 'package:coding_challenge/models/user.dart';
import 'package:coding_challenge/services/singletons/api_service.dart';
import 'package:coding_challenge/services/singletons/storage_service.dart';
import 'package:flutter/foundation.dart';

/// Service for handling authorization logic and accessing user data.
/// todo: this logic should be split in two classes.
class AuthService {
  final StorageService storage;
  User? user;
  AccessToken? accessToken;

  AuthService({required this.storage});

  /// This method should be called and awaited after object creation.
  //todo: make this better.
  Future<void> initialize() async {
    user ??= await storage.readUser();
    accessToken ??= await storage.readAccessToken();
  }

  Future<User?> login(String email, String password) async {
    if (isLoggedIn()) {
      return user;
    }

    var response = await ApiService.login(email, password);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      user = User.fromJson(responseData['subject']);
      accessToken = AccessToken.fromJson(responseData);
      //todo: check errors from converting
      storage.writeAccessToken(accessToken!);
      storage.writeUser(user!);
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
    }
    return user;
  }

  bool isLoggedIn() {
    //todo: differentiate not logged in and expired token statuses
    if (user == null || _isAccessTokenExpired()) {
      return false;
    }

    return true;
  }

  bool _isAccessTokenExpired()  {
    if (accessToken == null) {
      return true;
    }

    return accessToken!.expireAt.isBefore(DateTime.now());
  }
}
