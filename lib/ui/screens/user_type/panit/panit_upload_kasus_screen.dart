import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/constant/constant.dart';
import 'package:power_on_hand/core/controllers/kasus_controller.dart';
import 'package:power_on_hand/ui/screens/base_screen/base_input_background.dart';
import 'package:power_on_hand/ui/widgets/grafik/laporan_kasus_list_item.dart';
import 'package:power_on_hand/ui/widgets/input/text_and_input_widget.dart';

class PanitUploadKasusScreen extends StatefulWidget {
  @override
  _PanitUploadKasusScreenState createState() => _PanitUploadKasusScreenState();
}

class _PanitUploadKasusScreenState extends State<PanitUploadKasusScreen> {
  List<int> kasusChosenId = [];
  @override
  Widget build(BuildContext context) {
    return BaseInputBackground(
      title: 'Upload Kasus',
      buttonOnTap: () {
        KasusController.to.updateStatusKasus(
          status: 1,
          listKasusId: kasusChosenId,
        );
      },
      buttonText: 'Upload',
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAndChipWidget(
            text: 'Kepada',
            textChip: 'Kanit',
          ),
          TextAndChipWidget(
            text: 'Dari',
            textChip: 'Panit',
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
                        'Nama Penyidik',
                        style: GoogleFonts.varelaRound(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Perkara',
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
                GetBuilder<KasusController>(
                  builder: (_) {
                    if (_.listKasusByType == null) {
                      _.getKasusListByType(UserType.panit);
                      return Center(child: CircularProgressIndicator());
                    }
                    return SizedBox(
                      height: Get.height / 2,
                      child: _.listKasusByType.isEmpty
                          ? Center(
                              child: Text('No history found '),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) => Divider(height: 1),
                              itemCount: _.listKasusByType.length,
                              itemBuilder: (context, index) {
                                return LaporanKasusListItem(
                                  kasus: _.listKasusByType[index],
                                  kasusChosenId: kasusChosenId,
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
