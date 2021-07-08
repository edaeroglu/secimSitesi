import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    @required this.user,
  });

  User user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  User({
    @required this.id,
    @required this.userImage,
    @required this.userDeviceId,
    @required this.userNotificationToken,
    @required this.userAuth,
    @required this.userGender,
    @required this.userPhone,
    @required this.userAlliance,
    @required this.userParty,
    @required this.userBirthday,
    @required this.userEmailVerified,
    @required this.userName,
    @required this.userMail,
    @required this.userCountry,
    @required this.userCity,
    @required this.userDistrict,
  });

  String id;
  String userImage;
  dynamic userDeviceId;
  dynamic userNotificationToken;
  int userAuth;
  dynamic userGender;
  dynamic userPhone;
  dynamic userAlliance;
  dynamic userParty;
  dynamic userBirthday;
  String userEmailVerified;
  String userName;
  String userMail;
  String userCountry;
  String userCity;
  String userDistrict;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    userCountry: json["UserCountry"],
    userCity: json["UserCity"],
    userDistrict: json["UserDistrict"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
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
    "UserCountry": userCountry,
    "UserCity": userCity,
    "UserDistrict": userDistrict,
  };
}
