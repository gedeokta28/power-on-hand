import 'package:flutter/material.dart';

class BasicListModel {
  int id;
  String name;

  BasicListModel({
    @required this.id,
    @required this.name,
  });

  factory BasicListModel.fromJson(Map<String, dynamic> json) {
    return BasicListModel(
      id: json['id'],
      name: json['name'] ?? "",
    );
  }
}
