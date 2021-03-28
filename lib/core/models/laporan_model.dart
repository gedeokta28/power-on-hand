import 'package:flutter/material.dart';

class LaporanModel {
  int id;
  String nomor;
  String type;
  String file;
  String userId;
  String status;

  LaporanModel({
    @required this.id,
    @required this.status,
    @required this.userId,
    @required this.file,
    @required this.type,
    @required this.nomor,
  });

  factory LaporanModel.fromJson(Map<String, dynamic> json) {
    return LaporanModel(
      id: json['id'],
      nomor: json['nomor'] ?? "",
      type: json['type'] ?? "",
      file: json['file'] ?? "",
      userId: json['user_id'] ?? "",
      status: json['status'] ?? "",
    );
  }
}
