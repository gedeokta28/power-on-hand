import 'package:get/get.dart';

// const double baseHeight = 650.0;

// double sizeAwareScreen(double size) {
//   return size * Get.height / baseHeight;
// }

// Relative Scale package responsive method
final paddingX = Get.width * 0.04;
final double paddingY = sy(16);

const double scale = 1;
double sy(double value) {
  return (Get.height * _calculate(value)).roundToDouble();
}

double sx(double value) {
  return (Get.width * _calculate(value)).roundToDouble();
}

double _calculate(double value) {
  return ((value / 100) / 5.333333333333333) * scale;
}
