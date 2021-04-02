import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:power_on_hand/core/utils/helper_utils.dart';

class SearchInputWidget extends StatelessWidget {
  final String title;
  final bool addDate;

  SearchInputWidget(this.title, {this.addDate = true});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 8, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: TextField(
                      autofocus: false,
                      onChanged: (value) {
                        print(value);
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: title ?? '',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
                  child: Icon(FontAwesomeIcons.search, size: 20),
                ),
              ],
            ),
          ),
        ),
        !addDate
            ? SizedBox()
            : InkWell(
                onTap: () {
                  HelperUtils.getDatePicker();
                },
                child: Ink(
                  padding: EdgeInsets.fromLTRB(8, 0, 16, 16),
                  child: Icon(FontAwesomeIcons.calendarDay, size: 20),
                ),
              ),
      ],
    );
  }
}
