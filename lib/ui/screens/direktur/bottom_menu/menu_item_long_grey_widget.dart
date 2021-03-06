import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/ui/widgets/grafik/dashboard_menu_item_widget.dart';

class MenuItemLongGreyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  const MenuItemLongGreyWidget({
    Key key,
    @required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DashboardMenuItemWidget(widget: Icon(FontAwesomeIcons.industry)),
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Colors.grey.shade300,
              ),
              padding: subtitle == null ? EdgeInsets.fromLTRB(12, 14, 8, 14) : EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.varelaRound(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  subtitle == null
                      ? SizedBox()
                      : Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.varelaRound(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
