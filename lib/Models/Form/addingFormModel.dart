import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/homeScreen.dart';

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('authToken');
  return token;
}

class FormSubmition {
  static Future<void> submitForm({
    required BuildContext context,
    required String widowNameController,
    required String husbandNameControlle,
    required String widowphoneNoController,
    required String widowCnicController,
    required String emailController,
    required String passwordController,
    required String husbandCnicController,
    required String relationController,
    required String gaurdianNameController,
    required String gaurdianphoneNumberController,
    required String districtNameController,
    required String tehsilNameController,
    required String villageNameController,
    required List<Map<String, dynamic>> deathCertificate,
    required List<Map<String, dynamic>> affidavte,
    required List<Map<String, dynamic>> bForms,
    required String kids,
  }) async {
    final token = await getToken();

    try {
      var formData = {
        'widow_name': widowNameController,
        'husband_name': husbandNameControlle,
        'widow_contact': widowphoneNoController,
        'email': emailController,
        'widow_nic': widowCnicController,
        'husband_nic': husbandCnicController,
        'relationship': relationController,
        'guardian_name': gaurdianNameController,
        'guardian_contact': gaurdianphoneNumberController,
        'kids': kids,
        'widow_district': districtNameController,
        'widow_tehsil': tehsilNameController,
        'widow_village': villageNameController,
        'password': kids,
      };
      List<http.MultipartFile> deathCertificatesSending = [];
      for (var file in deathCertificate) {
        deathCertificatesSending.add(
          await http.MultipartFile.fromPath(
            'Certificate',
            file['filePath'],
          ),
        );
      }
      List<http.MultipartFile> affidavtesSending = [];
      for (var file in affidavte) {
        affidavtesSending.add(
          await http.MultipartFile.fromPath(
            'affidavit',
            file['filePath'],
          ),
        );
      }

      List<http.MultipartFile> bFormsSending = [];
      for (var file in bForms) {
        bFormsSending.add(
          await http.MultipartFile.fromPath(
            'form_b',
            file['filePath'],
          ),
        );
      }

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://idrees.blogvali.com/api/widows/store'),
        // Uri.parse('https://rashan.zarif.tech/api/widows/store'),
      );

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      // Add form fields to the request
      formData.forEach(
        (key, value) {
          // print(key);
          // print(value);
          request.fields[key] = value;
        },
      );
      // Add files from the Death Certificate $ Affidavte file picker
      request.files.addAll(deathCertificatesSending);
      request.files.addAll(affidavtesSending);
      request.files.addAll(bFormsSending);
      var response = await request.send();

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Form Submitted Successfully");
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Fluttertoast.showToast(msg: "Form Submission Failed");
      }
    } catch (e) {
      // print("API Request Error: $e");
      Fluttertoast.showToast(msg: "Form Submission Error");
    }
  }
}
