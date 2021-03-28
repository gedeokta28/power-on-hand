import 'package:flutter/material.dart';

class LaporanHarianModel {
  int id;
  String name;
  String description;
  DateTime createdAt;

  LaporanHarianModel({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.createdAt,
  });

  factory LaporanHarianModel.fromJson(Map<String, dynamic> json) {
    return LaporanHarianModel(
      id: json['id'],
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      createdAt: DateTime.parse(json["created_at"]),
    );
  }
}
