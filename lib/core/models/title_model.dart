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
}
