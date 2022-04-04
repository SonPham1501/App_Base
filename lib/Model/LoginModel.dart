// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

import 'package:CenBase/Model/UserModel.dart';

LoginModel loginModelFromMap(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.idToken,
    this.accessToken,
    this.expiresIn,
    this.tokenType,
    this.refreshToken,
    this.scope,
    this.user
  });

  String? idToken;
  String? accessToken;
  int? expiresIn;
  String? tokenType;
  String? refreshToken;
  String? scope;
  UserModel? user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    idToken: json["id_token"] == null ? null : json["id_token"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    expiresIn: json["expires_in"] == null ? null : json["expires_in"],
    tokenType: json["token_type"] == null ? null : json["token_type"],
    refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
    scope: json["scope"] == null ? null : json["scope"],
    user : json['user'] != null ? new UserModel.fromJson(json['user']) : null,
  );

  Map<String, dynamic> toJson() => {
    "id_token": idToken == null ? null : idToken,
    "access_token": accessToken == null ? null : accessToken,
    "expires_in": expiresIn == null ? null : expiresIn,
    "token_type": tokenType == null ? null : tokenType,
    "refresh_token": refreshToken == null ? null : refreshToken,
    "scope": scope == null ? null : scope,
    "user": user == null ? null : user,
  };
}
