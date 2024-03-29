import 'package:flutter/material.dart';

class KasusModel {
  int id;
  String name;
  String description;
  String anvil;
  String evidence;
  String idcard;
  String persuasive;
  String affairId;
  String provisionId;
  String plan;
  String userId;
  String status;
  String affairName;
  String provisionName;
  String userName;
  DateTime createdAt;

  KasusModel({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.anvil,
    @required this.evidence,
    @required this.idcard,
    @required this.persuasive,
    @required this.affairId,
    @required this.provisionId,
    @required this.plan,
    @required this.userId,
    @required this.status,
    @required this.provisionName,
    @required this.affairName,
    @required this.userName,
    @required this.createdAt,
  });

  factory KasusModel.fromJson(Map<String, dynamic> json) {
    return KasusModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      anvil: json['anvil'],
      evidence: json['evidence'],
      idcard: json['idcard'],
      persuasive: json['persuasive'],
      affairId: json['affair_id'],
      provisionId: json['provision_id'],
      plan: json['plan'],
      affairName: json['affair'] != null ? json['affair']['name'] : "",
      provisionName: json['provision'] != null ? json['provision']['name'] : "",
      userName: json['user'] != null ? json['user']['name'] : "",
      userId: json['userId'],
      status: json['status'],
      createdAt: DateTime.parse(json["created_at"]),
    );
  }
}
