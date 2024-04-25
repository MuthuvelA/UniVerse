import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Conversion App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('File Conversion App'),
        ),
        body: Center(
          child: ConvertButton(),
        ),
      ),
    );
  }
}

class ConvertButton extends StatelessWidget {
  Future<void> convertFile() async {
    // Get the directory where the original file is located
    final String downloadDirectory = await _getDownloadDirectory();

    // Construct the file path for the original file
    final String originalFilePath = '$downloadDirectory/hi.xlsx';

    // Read bytes from the original file
    final File originalFile = File(originalFilePath);
    if (!await originalFile.exists()) {
      print('Error: Original file not found.');
      return;
    }
    final bytes = await originalFile.readAsBytes();

    // Encode bytes to base64 string
    final base64String = base64.encode(bytes);

    // Decode base64 string to bytes
    final decodedBytes = base64.decode(base64String);

    // Construct the file path for the new file
    final String newFilePath = '$downloadDirectory/prakash.xlsx';

    // Write decoded bytes to the new file
    final File newFile = File(newFilePath);
    await newFile.writeAsBytes(decodedBytes);

    print("File conversion successful. New file saved at: $newFilePath");
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
