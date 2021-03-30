import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseDropdownModel {
  String title;
  String value;
  BaseDropdownModel({
    @required this.title,
    @required this.value,
  });
}

class BaseDropdownWidget extends StatelessWidget {
  final String value;
  final String dropdownHintText;
  final Function onChanged;
  final List<BaseDropdownModel> listDropdownData;
  final Color fillColor;
  const BaseDropdownWidget({
    Key key,
    @required this.value,
    @required this.dropdownHintText,
    @required this.onChanged,
    this.fillColor,
    @required this.listDropdownData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        border: Border.all(),
        color: fillColor ?? Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: value,
          isExpanded: true,
          hint: Text(
            dropdownHintText,
            style: GoogleFonts.varelaRound(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
          items: listDropdownData
              .map(
                (data) => DropdownMenuItem(
                    child: Text(
                      data.title,
                      style: GoogleFonts.varelaRound(fontSize: 14),
                    ),
                    value: data.value),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
