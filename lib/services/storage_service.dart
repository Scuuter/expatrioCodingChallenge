import 'dart:convert';

import 'package:coding_challenge/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service for saving and retrieving secure data on device.
/// Can be used for caching.
class StorageService {
  final storage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'accessToken';
  static const String _userKey = 'user';

  void writeAccessToken(String accessToken) {
    storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> readAccessToken() {
    return storage.read(key: _accessTokenKey);
  }

  void writeUser(User user) {
    storage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }

  Future<User?> readUser() {
    return storage.read(key: _userKey).then((userData) {
       return (userData != null) ? User.fromJson(jsonDecode(userData)) : null;
    });
  }
}
