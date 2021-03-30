import 'package:flutter/material.dart';

class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String status;
  String gender;
  String title;
  int age;
  String work;
  String grade;
  int gradeId;
  DateTime birthDate;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.gender,
    @required this.status,
    @required this.work,
    @required this.age,
    @required this.title,
    @required this.gradeId,
    @required this.grade,
    @required this.birthDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone_no'] ?? "",
      status: json['status'] ?? "",
      gender: json['gender'] ?? null,
      work: json['work'] ?? "",
      age: json['age'] ?? "",
      birthDate: json['birth_date'] == null || json['birth_date'] == '' ? null : DateTime.parse(json['birth_date']),
      grade: json['grade'] == null ? null : json['grade']['name'],
      gradeId: json['grade'] == null ? null : json['grade']['id'],
      title: json['title'] == null ? '' : json['title']['role'],
    );
  }
}
