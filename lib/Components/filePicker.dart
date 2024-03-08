import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Screens/Form/Screens/fileListScreen.dart';

class SingleFilePicker extends StatefulWidget {
  final void Function(List<Map<String, dynamic>>) onFilesSelected;
  const SingleFilePicker({super.key, required this.onFilesSelected});

  @override
  State<SingleFilePicker> createState() => _FormButtonState();
}

class _FormButtonState extends State<SingleFilePicker> {
  List<Map<String, dynamic>> fileInfos =
      []; // Changed to a list to handle multiple files

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.black),
              child: TextButton(
                onPressed: () {
                  _picker();
                },
                child: const Text(
                  "Choose File",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FileListScreen(fileInfos)));
              },
              child: Text(
                _getDisplayNames(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getDisplayNames() {
    // Combine the names of selected files for display
    return fileInfos.map((file) => file['fileName']).join(', ');
  }

  void _picker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
      allowMultiple: true, // Allow selecting multiple files
    );

    if (result != null && result.files.isNotEmpty) {
      List<Map<String, dynamic>> selectedFiles = result.files.map((file) {
        return {
          'fileName': file.name,
          'filePath': file.path,
        };
      }).toList();

      widget.onFilesSelected(
          selectedFiles); // Pass the list of selected files to the callback

      Fluttertoast.showToast(msg: "Files are picked");
      setState(() {
        fileInfos = selectedFiles;
      });
    } else {
      Fluttertoast.showToast(msg: "Files are not picked");
    }
  }
}
