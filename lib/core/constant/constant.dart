import 'package:get/get.dart';

const double baseHeight = 640.0;
const double baseWidth = 360.0;

// Relative Scale package responsive method
final paddingX = Get.width * 0.04;
final double paddingY = sy(16);

const double scale = 1;
double sy(double value) {
  return value * Get.height / baseHeight;
}

double sx(double value) {
  return value * Get.width / baseHeight;
}
