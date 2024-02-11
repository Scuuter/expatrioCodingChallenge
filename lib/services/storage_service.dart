import 'dart:convert';

import 'package:coding_challenge/models/access_token.dart';
import 'package:coding_challenge/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service for saving and retrieving secure data on device.
/// Can be used for caching.
class StorageService {
  final storage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'accessToken';
  static const String _userKey = 'user';

  void writeAccessToken(AccessToken accessToken) {
    storage.write(
        key: _accessTokenKey, value: jsonEncode(accessToken.toJson()));
  }

  Future<AccessToken?> readAccessToken() {
    return storage.read(key: _accessTokenKey).then((data) {
      return (data != null) ? AccessToken.fromJson(jsonDecode(data)) : null;
    });
  }

  void writeUser(User user) {
    storage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }

  Future<User?> readUser() {
    return storage.read(key: _userKey).then((data) {
      return (data != null) ? User.fromJson(jsonDecode(data)) : null;
    });
  }
}
