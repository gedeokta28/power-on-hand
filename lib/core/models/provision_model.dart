import 'package:flutter/material.dart';

class ProvisionModel {
  int id;
  String name;
  String description;

  ProvisionModel({
    @required this.id,
    @required this.name,
    @required this.description,
  });

  factory ProvisionModel.fromJson(Map<String, dynamic> json) {
    return ProvisionModel(
      id: json['id'],
      name: json['name'] ?? "",
      description: json['description'] ?? "",
    );
  }
}
