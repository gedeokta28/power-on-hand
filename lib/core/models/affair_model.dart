import 'package:flutter/material.dart';

class AffairModel {
  int id;
  String name;
  int provision;

  AffairModel({
    @required this.id,
    @required this.name,
    @required this.provision,
  });

  factory AffairModel.fromJson(Map<String, dynamic> json) {
    return AffairModel(
      id: json['id'],
      name: json['name'] ?? "",
      provision: int.tryParse(json['provision_id']),
    );
  }
}
