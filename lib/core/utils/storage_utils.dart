import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageUtils {
  static StorageUtils get to => Get.find();

  GetStorage storage = GetStorage();

  saveToken(String token) => storage.write('token', token);
  get token => storage.read('token');
}
