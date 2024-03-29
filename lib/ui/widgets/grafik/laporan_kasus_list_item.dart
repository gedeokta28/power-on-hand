import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_on_hand/core/models/kasus_model.dart';
import 'package:power_on_hand/core/utils/helper_utils.dart';
import 'package:power_on_hand/ui/screens/kasus_detail_screen.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class LaporanKasusListItem extends StatefulWidget {
  final KasusModel kasus;
  final List<int> kasusChosenId;

  const LaporanKasusListItem({
    @required this.kasus,
    @required this.kasusChosenId,
  });

  @override
  _LaporanListItemState createState() => _LaporanListItemState();
}

class _LaporanListItemState extends State<LaporanKasusListItem> {
  bool check;

  @override
  void initState() {
    super.initState();
    check = false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.to(() => KasusDetailScreen(widget.kasus.id));
        },
        child: Padding(
          padding: EdgeInsets.only(top: 6),
          child: Row(
            children: [
              Checkbox(
                value: check,
                onChanged: (val) {
                  setState(() {
                    check = val;
                  });
                  if (val) {
                    widget.kasusChosenId.add(widget.kasus.id);
                  } else {
                    widget.kasusChosenId.remove(widget.kasus.id);
                  }
                },
              ),
              RoundedChipColor(text: widget.kasus.description, color: Color(0xFFB5FF88)),
              Spacer(),
              RoundedChipColor(text: widget.kasus.anvil, color: Color(0xFF3DB9FF)),
              Spacer(),
              RoundedChipColor(
                text: HelperUtils.getHumanDate(
                  widget.kasus.createdAt,
                  format: 'dd/MM/y',
                ),
                color: Color(0xFFFF8080),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
