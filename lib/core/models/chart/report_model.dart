class ReportModel {
  ReportModel({
    this.laporanMasuk,
    this.laporanTerselesaikan,
    this.laporanTidakTerselesaikan,
  });

  int laporanMasuk;
  int laporanTerselesaikan;
  int laporanTidakTerselesaikan;

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        laporanMasuk: json["Laporan Masuk"] == null ? null : json["Laporan Masuk"],
        laporanTerselesaikan: json["Laporan Terselesaikan"] == null ? null : json["Laporan Terselesaikan"],
        laporanTidakTerselesaikan:
            json["Laporan Tidak Terselesaikan"] == null ? null : json["Laporan Tidak Terselesaikan"],
      );
}
