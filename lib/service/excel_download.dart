// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';

Future<void> saveExcel(String filename, Uint8List byteList) async {
  final blob = Blob([byteList], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  final url = Url.createObjectUrlFromBlob(blob);
  final anchor = AnchorElement(href: url)
    ..setAttribute("download", filename)
    ..click();

  // Revoke the object URL to free up resources
  Url.revokeObjectUrl(url);
} 