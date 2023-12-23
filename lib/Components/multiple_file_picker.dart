import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:orphankor/Utils/flutter_toast.dart';

class MultipleFilePicker extends StatefulWidget {
  const MultipleFilePicker({Key? key}) : super(key: key);

  @override
  State<MultipleFilePicker> createState() => _MultipleFilePickerState();
}

class _MultipleFilePickerState extends State<MultipleFilePicker> {
  List<Map<String, dynamic>> fileInfos = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: TextButton(
            onPressed: () {
              _picker();
            },
            child: const Text(
              "Choose Multiple File",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        if (fileInfos.isNotEmpty)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FileListScreen(fileInfos),
                ),
              );
            },
            child: const Icon(Icons.arrow_circle_right_outlined,
                color: Colors.black, size: 35),
          ),
      ],
    );
  }

  void _picker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
      allowMultiple: true,
    );
    if (result != null) {
      setState(() {
        fileInfos = result.files
            .map((file) => {
                  'name': file.name,
                  'isUploaded':
                      true, // Set to true for simplicity; you should use your logic
                })
            .toList();
      });
      ToastUtils.showToast("File is Pick");
    } else {
      ToastUtils.showToast("File doesn't Pick");
    }
  }
}

// Show Files Name  Screen
class FileListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> fileInfos;

  const FileListScreen(this.fileInfos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('File List'),
      ),
      body: ListView.builder(
        itemCount: fileInfos.length,
        itemBuilder: (context, index) {
          final fileInfo = fileInfos[index];

          return ListTile(
            title: Row(
              children: [
                Text(fileInfo['name']),
                // if (fileInfo['isUploaded'] ?? false) Icon(Icons.arrow_forward),
              ],
            ),
          );
        },
      ),
    );
  }
}
