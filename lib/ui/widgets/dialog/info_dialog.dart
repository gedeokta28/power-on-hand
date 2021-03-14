import 'package:power_on_hand/core/constant/constant.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String text;
  final String clickText;
  final IconData icon;
  final Function onClickOK;
  final Function onClickCancel;

  InfoDialog(
      {@required this.text, @required this.icon, @required this.onClickOK, this.onClickCancel, this.clickText = "OK"});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Center(
          child: Icon(
            icon,
            color: Styles.primaryColor,
            size: 36,
          ),
        ),
        content: Text(text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            )),
        actions: <Widget>[
          onClickCancel != null
              ? OutlineButton(
                  onPressed: () => onClickCancel(),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  borderSide: BorderSide(color: Styles.primaryColor),
                  child: Text(
                    "Batal",
                    style: TextStyle(color: Styles.primaryColor, fontWeight: FontWeight.w600),
                  ),
                )
              : SizedBox(),
          RaisedButton(
            color: Styles.primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () => onClickOK(),
            child: Text(
              clickText,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
