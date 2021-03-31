import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:power_on_hand/ui/widgets/dialog/info_dialog.dart';
import 'package:power_on_hand/ui/widgets/dialog/loading_dialog.dart';

class DialogUtils {
  // closePreDialog is for closing dialog before opening new one
  static void showInfo(
    String message, {
    String buttonText = "OK",
    Function onClick,
    bool closeOnOk = true,
    bool closePreDialog = false,
  }) {
    if (closePreDialog) closeDialog();
    Get.dialog(
      InfoDialog(
        text: message,
        onClickOK: () {
          if (onClick != null) {
            if (closeOnOk) {
              Get.back();
            }
            onClick();
          } else {
            Get.back();
          }
        },
        icon: FontAwesomeIcons.checkCircle,
        clickText: buttonText,
      ),
      barrierDismissible: false,
    );
  }

  static void showWarning(
    String message, {
    String buttonText = "OK",
    Function onClick,
    bool closeOnOk = true,
    bool closePreDialog = false,
  }) {
    if (closePreDialog) closeDialog();
    Get.dialog(
      InfoDialog(
        text: message,
        onClickOK: () {
          if (onClick != null) {
            if (closeOnOk) {
              Get.back();
            }
            onClick();
          } else {
            Get.back();
          }
        },
        icon: FontAwesomeIcons.exclamationCircle,
        clickText: buttonText,
      ),
      barrierDismissible: false,
    );
  }

  static void showChoose(
    String message,
    String buttonText, {
    @required Function onClick,
    bool closeOnOk = true,
    bool closePreDialog = false,
  }) {
    if (closePreDialog) closeDialog();
    Get.dialog(
      InfoDialog(
        text: message,
        onClickOK: () {
          if (onClick != null) {
            if (closeOnOk) {
              Get.back();
            }
            onClick();
          } else {
            Get.back();
          }
        },
        icon: FontAwesomeIcons.checkCircle,
        onClickCancel: () => Get.back(),
        clickText: buttonText,
      ),
      barrierDismissible: false,
    );
  }

  static void showLoading(
    String message, {
    bool closePreDialog = false,
  }) {
    if (closePreDialog) closeDialog();
    Get.dialog(
      LoadingDialog(text: message),
      barrierDismissible: false,
    );
  }

  static void showWarningToast(String text) {
    showToastWidget(
      Container(
        height: 80,
        width: 160,
        padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(FontAwesomeIcons.exclamationCircle, color: Colors.white, size: 24),
            SizedBox(height: 8),
            Text(text, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      position: ToastPosition.center,
    );
  }

  static void closeDialog() {
    Navigator.of(Get.context, rootNavigator: true).pop();
  }
}
