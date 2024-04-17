import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ExcelDownload {
  Future<String> createExcel(String base64String) async {
    // Decode the base64 string
    List<int> bytes = base64.decode(base64String);
    print(bytes);
    print("check 1");
    // Get the path to the application documents directory
    Directory appDocDir = await getApplicationDocumentsDirectory();
    print("check 2");
    String appDocPath = appDocDir.path;

    // Create a file in the documents directory
    String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.xlsx';
    File file = File(appDocPath + '/' + fileName);

    // Write the decoded bytes to the file
    await file.writeAsBytes(bytes);

    // Return the path to the file
    return file.path;
  }

  Future<void> downloadFile(String url, String fileName) async {
    // Create a download task
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: (await getApplicationDocumentsDirectory()).path,
      fileName: fileName,
      showNotification: true,
      openFileFromNotification: true,
    );
  }
  // Future<void> downloadExcelFromBase64(String base64ExcelString) async {
  //   // Decode the base64 string
  //   final bytes = base64Decode(base64ExcelString);
  //
  //   // Generate a filename (optional)
  //   final filename = "downloaded_excel.xlsx";
  //
  //   // Construct the file path for the Downloads folder on Windows
  //   final downloadsDir = 'C:\\Users\\Dell\\Downloads'; // Windows path format
  //   final filePath = '$downloadsDir\\$filename'; // Concatenate filename to path
  //
  //   // Write the ByteData to a file using dart:io
  //   final file = File(filePath);
  //   await file.writeAsBytes(bytes.buffer.asUint8List());
  //
  //   // Show a download complete message (optional)
  //   print('File saved at: $filePath');
  // }
}
