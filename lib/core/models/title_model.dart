import 'dart:convert';

List<TitleModel> titleModelFromJson(String str) =>
    List<TitleModel>.from(json.decode(str).map((x) => TitleModel.fromJson(x)));

String titleModelToJson(List<TitleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TitleModel {
  TitleModel({
    this.id,
    this.name,
    this.alias,
    this.role,
    this.limit,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String alias;
  String role;
  String limit;
  DateTime createdAt;
  DateTime updatedAt;

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(
        id: json["id"],
        name: json["name"],
        alias: json["alias"] == null ? null : json["alias"],
        role: json["role"],
        limit: json["limit"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alias": alias == null ? null : alias,
        "role": role,
        "limit": limit,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
