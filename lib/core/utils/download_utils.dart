import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:power_on_hand/core/utils/dialog_utils.dart';

class DownloadUtils {
  static Future<Directory> getDownloadDirectory() async {
    // this will create new directory in internal storage
    // name PowerOnHand to save downloaded file
    Directory directory = await getExternalStorageDirectory();
    String newPath = "";
    print(directory);
    List<String> paths = directory.path.split("/");
    for (int x = 1; x < paths.length; x++) {
      String folder = paths[x];
      if (folder != "Android") {
        newPath += "/" + folder;
      } else {
        break;
      }
    }
    newPath = newPath + "/PowerOnHand";
    directory = Directory(newPath);

    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    return directory;
  }

  static Future<bool> requestPermissions() async {
    // storage permission ask
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    print('storage permission status: ' + status.isGranted.toString());

    return status.isGranted;
  }

  static Future download(String url) async {
    DialogUtils.showWarningToast('Download starting');

    final dir = await getDownloadDirectory();
    final isPermissionStatusGranted = await requestPermissions();

    // get file name by taking from the url
    var filesplit = url.split('/');
    String fileName = filesplit[5];

    if (isPermissionStatusGranted) {
      final savePath = path.join(dir.path, DateTime.now().millisecondsSinceEpoch.toString() + '-' + fileName);
      var res = await Dio().download(
        url,
        savePath,
      );
      if (res.statusCode == 200) {
        DialogUtils.showChoose(
          'Download berhasil \n\nApakah anda ingin membuka file ?',
          'Buka',
          onClick: () {
            OpenFile.open(savePath);
          },
        );
      }
    } else {
      DialogUtils.showWarning('Download gagal');
    }
  }
}
