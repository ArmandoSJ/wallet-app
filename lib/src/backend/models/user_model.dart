import 'dart:convert';

User usuarioFromJson(String str) => User.fromJson(json.decode(str));

String usuarioToJson(User data) => json.encode(data.toJson());

String sessionToJson(User data) => json.encode(data.toJsonSesion());

class User {
  String? vStatus;
  String? vUserId;
  String? vEmail;
  String? vName;
  String? vPassword;
  String? vPwd2;

  User({
    this.vStatus,
    this.vUserId,
    this.vEmail,
    this.vName,
    this.vPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        vStatus: json["vStatus"],
        vUserId: json["vUserID"],
        vEmail: json["vEmail"],
        vName: json["vName"],
        vPassword: json["vPassword"],
      );

  Map<String, dynamic> toJson() => {
        "vStatus": vStatus,
        "vUserID": vUserId,
        "vEmail": vEmail,
        "vName": vName,
        "vPassword": vPassword,
      };

  User.fromJsonList(Map<String, dynamic> json) {
    vStatus = json['VALIDAUSUARIO'];
    vUserId = json['USUARIOID'];
    vEmail = json['EMAIL'];
    vName = json['NOMBRE'];
  }

  Map<String, dynamic> toJsonSesion() => {
        "usr": vUserId,
        "pswd": vPassword,
      };
}