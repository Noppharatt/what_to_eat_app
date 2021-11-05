// To parse this JSON data, do
//
//     final reqRegister = reqRegisterFromJson(jsonString);

// ignore_for_file: file_names

import 'package:meta/meta.dart';
import 'dart:convert';

ReqRegister reqRegisterFromJson(String str) => ReqRegister.fromJson(json.decode(str));

String reqRegisterToJson(ReqRegister data) => json.encode(data.toJson());

class ReqRegister {
    ReqRegister({
        @required this.user,
        @required this.password,
        @required this.fname,
        @required this.lname,
        @required this.email,
        @required this.phone,
    });

    String user;
    String password;
    String fname;
    String lname;
    String email;
    String phone;

    factory ReqRegister.fromJson(Map<String, dynamic> json) => ReqRegister(
        user: json["user"] == null ? null : json["user"],
        password: json["password"] == null ? null : json["password"],
        fname: json["fname"] == null ? null : json["fname"],
        lname: json["lname"] == null ? null : json["lname"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "user": user == null ? null : user,
        "password": password == null ? null : password,
        "fname": fname == null ? null : fname,
        "lname": lname == null ? null : lname,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
    };
}
