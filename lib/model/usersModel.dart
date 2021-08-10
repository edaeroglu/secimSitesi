// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.userImage,
    this.userDeviceId,
    this.userNotificationToken,
    this.userAuth,
    this.userGender,
    this.userPhone,
    this.userAlliance,
    this.userParty,
    this.userBirthday,
    this.userEmailVerified,
    this.userName,
    required this.userMail,
    this.userPassword,
    this.userCountry,
    this.userCity,
    this.userCounty,
    this.userDistrict,
    this.userLastLogin,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? userImage;
  String? userDeviceId;
  String? userNotificationToken;
  int? userAuth;
  String? userGender;
  int? userPhone;
  String? userAlliance;
  String? userParty;
  String? userBirthday;
  String? userEmailVerified;
  String? userName;
  String userMail;
  String? userPassword;
  String? userCountry;
  String? userCity;
  String? userCounty;
  String? userDistrict;
  DateTime? userLastLogin;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    userImage: json["UserImage"],
    userDeviceId: json["UserDeviceId"],
    userNotificationToken: json["UserNotificationToken"],
    userAuth: json["UserAuth"],
    userGender: json["UserGender"],
    userPhone: json["UserPhone"],
    userAlliance: json["UserAlliance"],
    userParty: json["UserParty"],
    userBirthday: json["UserBirthday"],
    userEmailVerified: json["UserEmailVerified"],
    userName: json["UserName"],
    userMail: json["UserMail"],
    userPassword: json["UserPassword"],
    userCountry: json["UserCountry"],
    userCity: json["UserCity"],
    userCounty: json["UserCounty"],
    userDistrict: json["UserDistrict"],
    userLastLogin: DateTime.parse(json["UserLastLogin"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "UserImage": userImage,
    "UserDeviceId": userDeviceId,
    "UserNotificationToken": userNotificationToken,
    "UserAuth": userAuth,
    "UserGender": userGender,
    "UserPhone": userPhone,
    "UserAlliance": userAlliance,
    "UserParty": userParty,
    "UserBirthday": userBirthday,
    "UserEmailVerified": userEmailVerified,
    "UserName": userName,
    "UserMail": userMail,
    "UserPassword": userPassword,
    "UserCountry": userCountry,
    "UserCity": userCity,
    "UserCounty": userCounty,
    "UserDistrict": userDistrict,
  };
}
