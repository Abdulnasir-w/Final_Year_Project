import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:orphankor/Utils/flutter_toast.dart';

class SingleFilePicker extends StatefulWidget {
  final void Function(Map<String, dynamic>) onFileSelected;
  const SingleFilePicker({super.key, required this.onFileSelected});

  @override
  State<SingleFilePicker> createState() => _FormButtonState();
}

class _FormButtonState extends State<SingleFilePicker> {
  String fileName = '';
  //String extension = '';
  //List<int> bytes = [];
  @override
  Widget build(BuildContext context) {
    return Row(
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            fileName,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _picker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
      allowMultiple: false,
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      file.name;
      widget.onFileSelected({
        'fileName': file.name,
        'filePath': file.path,
      });
      ToastUtils.showToast("File is Pick");
      setState(() {
        fileName = file.name;
      });
    } else {
      ToastUtils.showToast("File doesn't Pick");
    }
  }
}
