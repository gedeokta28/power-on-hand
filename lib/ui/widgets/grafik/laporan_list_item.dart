import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

class LaporanListItem extends StatelessWidget {
  const LaporanListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(FontAwesomeIcons.squareFull, color: Colors.black54, size: 12),
          RoundedChipColor(text: 'Arif Sucahyo', color: Color(0xFFB5FF88)),
          RoundedChipColor(text: 'Judi Online', color: Color(0xFF3DB9FF)),
          RoundedChipColor(text: '21/02/2021', color: Color(0xFFFF8080)),
        ],
      ),
    );
  }
}
