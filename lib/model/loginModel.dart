// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

LoginModel loginModelFromMap(String str) => LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
    LoginModel({
        required this.data,
    });

    LoginModelData data;

    factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        data: LoginModelData.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}

class LoginModelData {
    LoginModelData({
        required this.emailUser,
        required this.id,
        required this.lnameUser,
        required this.nameUser,
        required this.passwordUser,
        required this.token,
    });

    dynamic emailUser;
    dynamic id;
    dynamic lnameUser;
    dynamic nameUser;
    dynamic passwordUser;
    dynamic token;

    factory LoginModelData.fromMap(Map<String, dynamic> json) => LoginModelData(
        emailUser: json["email_user"],
        id: json["id"],
        lnameUser: json["lname_user"],
        nameUser: json["name_user"],
        passwordUser: json["password_user"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "email_user": emailUser,
        "id": id,
        "lname_user": lnameUser,
        "name_user": nameUser,
        "password_user": passwordUser,
        "token": token,
    };
}
