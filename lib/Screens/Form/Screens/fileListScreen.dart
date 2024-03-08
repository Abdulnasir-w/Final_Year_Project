import 'dart:io';
import 'package:flutter/material.dart';

import '../Image/imageScreen.dart';
import '../Image/pdfScreen.dart';

class FileListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> fileInfos;

  const FileListScreen(this.fileInfos, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Files",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: fileInfos.length,
        itemBuilder: (context, index) {
          return _buildFileItem(fileInfos[index], context);
        },
      ),
    );
  }

  Widget _buildFileItem(Map<String, dynamic> fileInfo, BuildContext context) {
    String fileName = fileInfo['fileName'];
    bool isImage = fileName.endsWith('.jpg') || fileName.endsWith('.png');
    bool isPdf = fileName.endsWith('.pdf');

    return ListTile(
      title: Text(fileName),
      subtitle: Text(isImage ? 'Image' : (isPdf ? 'PDF' : 'Unknown')),
      leading: isImage
          ? Image.file(
              File(fileInfo['filePath'])) // Assuming you have the file path
          : Icon(isPdf ? Icons.picture_as_pdf : Icons.insert_drive_file),
      onTap: () {
        if (isImage) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PhotoViewScreen(imagePath: fileInfo['filePath']),
            ),
          );
          // Implement logic to open image viewer
        } else if (isPdf) {
          // Implement logic to open PDF viewer
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PdfViewerScreen(pdfPath: fileInfo['filePath']),
            ),
          );
        }
      },
    );
  }
}
