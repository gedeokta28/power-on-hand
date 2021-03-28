import 'package:flutter/material.dart';

class KategoriPenilaianModel {
  int id;
  String description;
  String type;
  dynamic point;

  KategoriPenilaianModel({
    @required this.id,
    @required this.point,
    @required this.type,
    @required this.description,
  });

  factory KategoriPenilaianModel.fromJson(Map<String, dynamic> json) {
    return KategoriPenilaianModel(
      id: json['id'],
      description: json['description'] ?? "",
      type: json['type'] ?? "",
      point: json['point'] ?? "",
    );
  }
}
