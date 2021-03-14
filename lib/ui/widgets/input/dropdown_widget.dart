import 'package:flutter/material.dart';
import 'package:power_on_hand/core/models/title_model.dart';
import 'package:power_on_hand/ui/widgets/input/dropdown_formfield.dart';

class DropdownWidget extends StatelessWidget {
  final int dropdownValue;
  final Function dropdownCallback;
  final List<TitleModel> dropdownDataList;

  DropdownWidget({
    @required this.dropdownValue,
    @required this.dropdownCallback,
    @required this.dropdownDataList,
  });

  final List data = [
    {"display": "Member"},
    {"display": "Entrepreneur"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropDownFormField(
          hintText: 'Daftar Sebagai',
          value: dropdownValue,
          onSaved: (value) {
            dropdownCallback(value);
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          onChanged: (value) {
            dropdownCallback(value);
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          dropdownDataList: dropdownDataList,
          validator: (value) {
            if (value == null) {
              return 'title wajib diisi';
            }
            return null;
          },
        ),
      ],
    );
  }
}
