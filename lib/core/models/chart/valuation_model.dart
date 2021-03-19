class ValuationModel {
  ValuationModel({
    this.subdit1,
    this.subdit2,
    this.subdit3,
    this.subdit4,
    this.subdit5,
  });

  int subdit1;
  int subdit2;
  int subdit3;
  int subdit4;
  int subdit5;

  factory ValuationModel.fromJson(Map<String, dynamic> json) => ValuationModel(
        subdit1: json["Subdit 1"] == null ? null : json["Subdit 1"],
        subdit2: json["Subdit 2"] == null ? null : json["Subdit 2"],
        subdit3: json["Subdit 3"] == null ? null : json["Subdit 3"],
        subdit4: json["Subdit 4"] == null ? null : json["Subdit 4"],
        subdit5: json["Subdit 5"] == null ? null : json["Subdit 5"],
      );

  Map<String, dynamic> toJson() => {
        "Subdit 1": subdit1 == null ? null : subdit1,
        "Subdit 2": subdit2 == null ? null : subdit2,
        "Subdit 3": subdit3 == null ? null : subdit3,
        "Subdit 4": subdit4 == null ? null : subdit4,
        "Subdit 5": subdit5 == null ? null : subdit5,
      };
}
