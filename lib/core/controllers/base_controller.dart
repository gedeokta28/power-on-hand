import 'package:get/get.dart';

class BaseController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    update();
  }
}
