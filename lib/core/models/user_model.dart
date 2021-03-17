import 'package:flutter/material.dart';

class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String status;
  String title;
  UserModel({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.status,
    @required this.title,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      title: json['title'] == null ? '' : json['title']['role'],
    );
  }
}
