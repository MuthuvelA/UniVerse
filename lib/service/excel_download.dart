import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:excel/excel.dart' as excel;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// class ExcelDownload extends StatelessWidget{
//   Future<void> createExcel(String base64String) async {
    // Decode the base64 string
  //   Uint8List excelData = base64.decode(base64String);
  //
  //   // Parse the Excel data
  //   var excel = Excel.decodeBytes(excelData);
  //   print(excel);
  //   // Iterate over the sheets if needed
  //   // for (var table in excel.tables.keys) {
  //   //   print(table); //sheet Name
  //   //   print(excel.tables[table]!.maxRows);
  //   //   print(excel.tables[table]!.maxRows);
  //   //   for (var row in excel.tables[table]!.rows) {
  //   //     print('$row');
  //   //   }
  //   // }
  // }
  //
  // Future<void> downloadFile(String url, String fileName) async {
  //   // Create a download task
  //   final taskId = await FlutterDownloader.enqueue(
  //     url: url,
  //     savedDir: (await getApplicationDocumentsDirectory()).path,
  //     fileName: fileName,
  //     showNotification: true,
  //     openFileFromNotification: true,
  //   );
  // }
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
// }
class ExcelDownload {
  Future<void> saveExcel(String filename, Uint8List byteList) async {
    final blob = Blob([byteList], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    final url = Url.createObjectUrlFromBlob(blob);
    final anchor = AnchorElement(href: url)
      ..setAttribute("download", filename)
      ..click();

    // Revoke the object URL to free up resources
    Url.revokeObjectUrl(url);
  }

}

  Future<String> _getDownloadDirectory() async {
    Directory? downloadsDir;
    if (Platform.isAndroid) {
      downloadsDir = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      downloadsDir = await getApplicationDocumentsDirectory();
    }

    if (downloadsDir == null) {
      throw FileSystemException('Downloads directory not found.');
    }

    return downloadsDir.path;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: convertFile,
      child: const Text('Convert File'),
    );
  }
}
