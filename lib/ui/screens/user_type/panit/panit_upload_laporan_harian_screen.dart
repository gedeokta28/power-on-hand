import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/laporan_harian_controller.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/widgets/grafik/laporan_harian_list_item%20copy.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';

class PanitUploadLaporanHarianScreen extends StatefulWidget {
  @override
  _PanitUploadLaporanHarianScreenState createState() => _PanitUploadLaporanHarianScreenState();
}

class _PanitUploadLaporanHarianScreenState extends State<PanitUploadLaporanHarianScreen> {
  List<int> kasusChosenId = [];
  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Upload Laporan Harian',
      buttonOnTap: () {
        LaporanHarianController.to.updateStatusLaporanHarian(
          status: 1,
          listKasusId: kasusChosenId,
        );
        showToast('wip');
      },
      buttonText: 'Upload',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAndChipWidget(
            text: 'Kepada',
            textChip: 'Wadir',
          ),
          TextAndChipWidget(
            text: 'Dari',
            textChip: 'Kasubdit',
          ),
          SizedBox(height: 8),
          Text(
            'Laporan Masuk',
            style: GoogleFonts.varelaRound(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(sy(8)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 0.1,
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Nama',
                        style: GoogleFonts.varelaRound(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Deskripsi',
                        style: GoogleFonts.varelaRound(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Tanggal',
                        style: GoogleFonts.varelaRound(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GetBuilder<LaporanHarianController>(
                  builder: (_) {
                    if (_.listLaporanHarian == null) {
                      _.getLaporanHarianList(UserType.panit);
                      return Center(child: CircularProgressIndicator());
                    }
                    return SizedBox(
                      height: Get.height / 2,
                      child: _.listLaporanHarian.isEmpty
                          ? Center(
                              child: Text('No history found '),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) => Divider(height: 1),
                              itemCount: _.listLaporanHarian.length,
                              itemBuilder: (context, index) {
                                return LaporanHarianListItem(
                                  harian: _.listLaporanHarian[index],
                                  harianChosenId: kasusChosenId,
                                );
                              },
                            ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
