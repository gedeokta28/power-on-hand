import 'package:flutter/material.dart';
import 'package:power_on_hand/core/constant/constant.dart';

class ScaffoldThreeTopCircleContainer extends StatelessWidget {
  ScaffoldThreeTopCircleContainer({
    Key key,
    @required this.children,
  }) : super(key: key);

  final Column children;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Blue Circle
              Positioned(
                top: -10,
                right: -150,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFF58BFE6),
                    borderRadius: BorderRadius.circular(180),
                  ),
                ),
              ),
              // Grey Circle
              Positioned(
                top: -270,
                left: -100,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color(0xFF4C525C),
                    borderRadius: BorderRadius.circular(300),
                  ),
                ),
              ),
              // Red Circle
              Positioned(
                top: -120,
                left: -70,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF4848),
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingX, vertical: paddingY),
                child: children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
