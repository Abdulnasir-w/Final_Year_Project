import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:orphankor/Screens/Form/file_list.dart';
import 'package:orphankor/Utils/flutter_toast.dart';

class MultipleFilePicker extends StatefulWidget {
  final Function(List<Map<String, dynamic>> files) onFilesSelected;
  const MultipleFilePicker({
    Key? key,
    required this.onFilesSelected,
  }) : super(key: key);

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
        _buildFilePickerButton(),
        if (fileInfos.isNotEmpty) _buildFileListButton(),
      ],
    );
  }

  Widget _buildFilePickerButton() {
    return Container(
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
          "Choose Multiple Files",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _picker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
      allowMultiple: true,
    );
    if (result != null) {
      List<Map<String, dynamic>> newFiles = result.files.map((file) {
        return {
          'name': file.name,
          'path': file.path,
          'isUploaded':
              true, // Set to true for simplicity; you should use your logic
        };
      }).toList();
      widget.onFilesSelected(newFiles);
      setState(() {
        fileInfos = newFiles;
      });
      ToastUtils.showToast("File is Pick");
    } else {
      ToastUtils.showToast("File doesn't Pick");
    }
  }

  Widget _buildFileListButton() {
    return Visibility(
      visible: fileInfos.isNotEmpty,
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FileListScreen(fileInfos)),
          );
        },
        icon: const Icon(
          Icons.arrow_circle_right_outlined,
          color: Colors.black,
          size: 35,
        ),
      ),
    );
  }
}
