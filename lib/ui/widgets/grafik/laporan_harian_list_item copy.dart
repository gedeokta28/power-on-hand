import 'package:flutter/material.dart';
import 'package:power_on_hand/core/models/laporan_harian_model.dart';
import 'package:power_on_hand/core/utils/helper_utils.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class LaporanHarianListItem extends StatefulWidget {
  final LaporanHarianModel harian;
  final List<int> harianChosenId;

  const LaporanHarianListItem({
    @required this.harian,
    @required this.harianChosenId,
  });

  @override
  _LaporanListItemState createState() => _LaporanListItemState();
}

class _LaporanListItemState extends State<LaporanHarianListItem> {
  bool check;

  @override
  void initState() {
    super.initState();
    check = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Checkbox(
            value: check,
            onChanged: (val) {
              setState(() {
                check = val;
              });
              if (val) {
                widget.harianChosenId.add(widget.harian.id);
              } else {
                widget.harianChosenId.remove(widget.harian.id);
              }
            },
          ),
          RoundedChipColor(text: widget.harian.name, color: Color(0xFFB5FF88)),
          Spacer(),
          RoundedChipColor(text: widget.harian.description, color: Color(0xFF3DB9FF)),
          Spacer(),
          RoundedChipColor(
            text: HelperUtils.getHumanDate(
              widget.harian.createdAt,
              format: 'dd/MM/y',
            ),
            color: Color(0xFFFF8080),
          ),
        ],
      ),
    );
  }
}
