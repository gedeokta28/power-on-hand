import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:power_on_hand/core/models/title_model.dart';

class DropDownFormField extends FormField<dynamic> {
  final String hintText;
  final String errorText;
  final dynamic value;
  final List<TitleModel> dropdownDataList;

  final Function onChanged;
  DropDownFormField({
    FormFieldSetter<dynamic> onSaved,
    FormFieldValidator<dynamic> validator,
    this.hintText = 'Select one option',
    this.errorText = 'Please select one option',
    this.value,
    this.dropdownDataList,
    this.onChanged,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.disabled,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DropdownButton<dynamic>(
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        underline: SizedBox(),
                        hint: Text(
                          hintText,
                          style: GoogleFonts.varelaRound(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: value == '' ? null : value,
                        onChanged: (dynamic newValue) {
                          state.didChange(newValue);
                          onChanged(newValue);
                        },
                        items: dropdownDataList.map((title) {
                          return DropdownMenuItem<dynamic>(
                            value: title.id,
                            child: Text(
                              title.name,
                              style: GoogleFonts.varelaRound(
                                fontSize: 14,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    children: [
                      SizedBox(height: state.hasError ? 5.0 : 0.0),
                      Text(
                        state.hasError ? state.errorText : '',
                        style: GoogleFonts.varelaRound(
                          fontSize: state.hasError ? 14.0 : 0.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
}
