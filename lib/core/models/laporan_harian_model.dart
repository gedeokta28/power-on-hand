import 'package:flutter/material.dart';

class LaporanHarianModel {
  int id;
  String name;
  String crimeScrene;
  String evidence;
  String idCard;
  String fingerprint;
  String affairName;
  DateTime createdAt;

  LaporanHarianModel({
    @required this.id,
    @required this.name,
    @required this.crimeScrene,
    @required this.evidence,
    @required this.idCard,
    @required this.fingerprint,
    @required this.affairName,
    @required this.createdAt,
  });

  factory LaporanHarianModel.fromJson(Map<String, dynamic> json) {
    return LaporanHarianModel(
      id: json['id'],
      name: json['name'],
      crimeScrene: json['crime_scene'],
      evidence: json['evidence'],
      idCard: json['idcard'],
      fingerprint: json['fingerprint'],
      affairName: json['affair'] != null ? json['affair']['name'] : "",
      createdAt: DateTime.parse(json["created_at"]),
    );
  }
}
