import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../model/loginModel.dart';

class Manager {
  LoginModel? loginModel;
  LoginModelData? loginModelData;

  var snackBar;
  register(
      {required String name,
      required String lname,
      required String email,
      required String password,
      required BuildContext context}) async {
    print(name);
    var request = http.MultipartRequest('POST', Uri.parse('http://10.30.2.32:5000/Register'));
    request.fields.addAll({
      'name_user': '${name}',
      'lname_user': '${lname}',
      'password_user': '${password}',
      'email_user': '${email}'
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      context.go("/login");
      return true;
    } else {
      snackBar = SnackBar(
        content: const Text('ไม่สำเร็จ'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
  }

  login({required String email, required String password, required BuildContext context}) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://10.30.2.32:5000/Login'));
    request.fields.addAll({'email': email, 'password': password});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var responsejson = json.decode((data));
      loginModelData = LoginModelData.fromMap(responsejson["data"]);
      context.go("/Home");
      print(loginModelData?.token);
    } else {
      snackBar = SnackBar(
        content: const Text('ไม่สำเร็จ'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
