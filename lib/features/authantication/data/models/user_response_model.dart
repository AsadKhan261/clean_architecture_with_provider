import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  int code;
  String message;
  Data data;

  UserModel({
    required this.id,
    required this.code,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["\u0024id"],
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String id;
  int dataId;
  String name;
  String email;
  String token;

  Data({
    required this.id,
    required this.dataId,
    required this.name,
    required this.email,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["\u0024id"],
    dataId: json["Id"],
    name: json["Name"],
    email: json["Email"],
    token: json["Token"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "Id": dataId,
    "Name": name,
    "Email": email,
    "Token": token,
  };
}
