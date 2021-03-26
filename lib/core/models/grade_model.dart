import 'package:flutter/material.dart';

class GradeModel {
  int id;
  String name;

  GradeModel({
    @required this.id,
    @required this.name,
  });

  factory GradeModel.fromJson(Map<String, dynamic> json) {
    return GradeModel(
      id: json['id'],
      name: json['name'] ?? "",
    );
  }
}
