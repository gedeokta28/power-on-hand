import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onPressed;
  final bool isLoading;
  final double padding;
  final double radius;
  final bool flex;
  final double fontSize;
  final Color fontColor;

  const PrimaryButton({
    @required this.title,
    this.color = Colors.white,
    this.onPressed,
    this.padding = 12,
    this.isLoading = false,
    this.radius = 8,
    this.fontSize = 14,
    this.fontColor = Colors.black87,
    this.flex = false,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: isLoading ? () {} : onPressed,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        alignment: flex ? Alignment.center : null,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(backgroundColor: Colors.white70),
              )
            : Text(
                title,
                style: GoogleFonts.varelaRound(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                ),
              ),
      ),
    );
  }
}
