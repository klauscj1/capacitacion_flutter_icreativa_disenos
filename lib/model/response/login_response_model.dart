import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.ok,
    this.uid,
    this.name,
    this.token,
    this.msg,
  });

  bool? ok;
  int? uid;
  String? name;
  String? token;
  String? msg;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        ok: json["ok"],
        uid: json["uid"],
        name: json["name"],
        token: json["token"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "uid": uid,
        "name": name,
        "token": token,
        "msg": msg,
      };
}
