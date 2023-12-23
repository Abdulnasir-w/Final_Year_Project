import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:orphankor/Utils/flutter_toast.dart';

class FormButton extends StatefulWidget {
  const FormButton({super.key});

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
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
        //Text(extension),
        //Text(bytes.toString()),
      ],
    );
  }

  void _picker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf', 'doc'],
      allowMultiple: false,
      //withData: true,
    );
    //(result != null && result.files.single.path != null)
    if (result != null) {
      PlatformFile file = result.files.first;
      file.name;
      //file.extension;
      //file.bytes;
      ToastUtils.showToast("File is Pick");
      //File _file = File(result.files.single.path!)
      setState(() {
        fileName = file.name;
        //extension = file.extension!;
        // bytes = file.bytes!;
      });
    } else {
      ToastUtils.showToast("File doesn't Pick");
    }
  }
}
