import 'package:flutter/material.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class LaporanListItem extends StatefulWidget {
  const LaporanListItem({
    Key key,
  }) : super(key: key);

  @override
  _LaporanListItemState createState() => _LaporanListItemState();
}

class _LaporanListItemState extends State<LaporanListItem> {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Checkbox(
            value: check,
            onChanged: (val) {
              setState(() {
                check = val;
              });
            },
          ),
          RoundedChipColor(text: 'Arif Sucahyo', color: Color(0xFFB5FF88)),
          RoundedChipColor(text: 'Judi Online', color: Color(0xFF3DB9FF)),
          RoundedChipColor(text: '21/02/2021', color: Color(0xFFFF8080)),
        ],
      ),
    );
  }
}
