import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ExcelDownload {
  Future<void> base64ToExcel(String base64ExcelData) async {
    try {
      // Decode Base64 to binary data
      List<int> bytes = base64.decode(base64ExcelData);

      // Get the app's local documents directory
      Directory appDocDir = await getApplicationDocumentsDirectory();

      // Define the file path
      String filePath = '${appDocDir.path}/decrypted_excel_file.xlsx';

      // Write binary data to a file
      File file = File(filePath);
      await file.writeAsBytes(bytes);

      // Open the file for the user
      OpenFile.open(filePath);
    } catch (e) {
      print('Error decoding and downloading Excel file: $e');
    }
  }
}
