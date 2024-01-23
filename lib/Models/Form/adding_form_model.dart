import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:orphankor/Screens/home_screen.dart';
import 'package:orphankor/Utils/flutter_toast.dart';

class FormSubmition {
  static Future<void> submitForm({
    required BuildContext context,
    required String widowNameController,
    required String husbandNameControlle,
    required String phoneNoController,
    required String widowCnicController,
    required String emailController,
    required String husbandCnicController,
    required String relationController,
    required String gaurdianNameController,
    required String phoneNumberController,
    required String districtNameController,
    required String tehsilNameController,
    required String villageNameController,
    required List<Map<String, dynamic>> deathCertificate,
    required List<Map<String, dynamic>> affidavte,
    required List<Map<String, dynamic>> multiFilePicker,
    required String dropDownValue,
  }) async {
    try {
      var formData = {
        'widowname': widowNameController,
        'husbandname': husbandNameControlle,
        'phoneno': phoneNoController,
        'email': emailController,
        'widowcnic': widowCnicController,
        'husbandcnic': husbandCnicController,
        'Relation': relationController,
        'Gaurdianname': gaurdianNameController,
        'phonenumnber': phoneNumberController,
        'district': districtNameController,
        'tehsil': tehsilNameController,
        'village': villageNameController,
        'dropdownvalue': dropDownValue,
      };
      List<http.MultipartFile> deathCertificates = [];
      for (var file in deathCertificate) {
        deathCertificates.add(
          await http.MultipartFile.fromPath(
            'sinlgeSelectedFilePicker',
            file['path'],
          ),
        );
      }
      List<http.MultipartFile> affidavtes = [];
      for (var file in affidavte) {
        affidavtes.add(
          await http.MultipartFile.fromPath(
            'sinlgeSelectedFilePicker',
            file['path'],
          ),
        );
      }
      List<http.MultipartFile> multiSelectFilePicker = [];
      for (var file in multiFilePicker) {
        multiSelectFilePicker.add(
          await http.MultipartFile.fromPath(
            'multiSelectFilePicker',
            file['path'],
          ),
        );
      }
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://localhost:your_port_number/add-widows'),
      );
      // Add form fields to the request
      formData.forEach(
        (key, value) {
          request.fields[key] = value;
        },
      );
      // Add files from the Death Certificate $ Affidavte file picker
      request.files.addAll(deathCertificates);
      request.files.addAll(affidavtes);
      // Add files from the Multiple file picker
      request.files.addAll(multiSelectFilePicker);
      var response = await request.send();
      if (response.statusCode == 200) {
        ToastUtils.showToast("Form Submitted Successfully");
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        ToastUtils.showToast("Form Submission Failed");
      }
    } catch (e) {
      print("API Request Error: $e");
      ToastUtils.showToast("Form Submission Error");
    }
  }
}
