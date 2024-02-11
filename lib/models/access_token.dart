import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable()
class AccessToken {
  @JsonKey(name: 'accessToken')
  final String token;

  @JsonKey(name: 'accessTokenExpiresAt')
  final DateTime expireAt;

  AccessToken({
    required this.token,
    required this.expireAt,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
