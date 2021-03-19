class DailyModel {
  DailyModel({
    this.name,
    this.total,
    this.percentange,
  });

  String name;
  int total;
  int percentange;

  factory DailyModel.fromJson(Map<String, dynamic> json) => DailyModel(
        name: json["name"],
        total: json["total"],
        percentange: json["percentange"],
      );
}
