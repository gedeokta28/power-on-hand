import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class FileUtils {
  static Future<PlatformFile> openFileExplorer() async {
    PlatformFile file;
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );

      if (result != null) {
        file = result.files.first;
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }

    return file;
  }
}
