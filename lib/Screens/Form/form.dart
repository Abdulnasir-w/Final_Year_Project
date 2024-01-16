import 'package:flutter/material.dart';
import 'package:orphankor/Components/button.dart';
import 'package:orphankor/Components/drawer.dart';
import 'package:orphankor/Components/drop_down_button.dart';
import 'package:orphankor/Components/file_picker.dart';
import 'package:orphankor/Components/multiple_file_picker.dart';
import 'package:orphankor/Components/textform_email.dart';
import 'package:orphankor/Models/Form/adding_form_model.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final widowNameController = TextEditingController();
    final husbandNameController = TextEditingController();
    final phoneNoController = TextEditingController();
    final widowCnicController = TextEditingController();
    final husbandCnicController = TextEditingController();
    final orphanNameController = TextEditingController();
    final fatherNameController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final districtNameController = TextEditingController();
    final tehsilNameController = TextEditingController();
    final villageNameController = TextEditingController();
    List<Map<String, dynamic>> deathCertificate = [];
    List<Map<String, dynamic>> affidavte = [];
    List<Map<String, dynamic>> multipleSelectedFiles = [];
    String selectedDropdownValue = '';
    //print("updated $selectedDropdownValue");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("Forms"),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                //TextFormField Widow
                CustomTextForm(
                  label: "Widow Name",
                  controller: widowNameController,
                  title: "Enter Widow Name",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Widow Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //TextFormField Husband Name
                CustomTextForm(
                  label: "Husband Name",
                  title: "Enter Husband Name",
                  controller: husbandNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Husband Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //TextFormField Phone No

                CustomTextForm(
                  label: "Phone No",
                  title: "03401234567",
                  controller: phoneNoController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Phone Number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //TextFormField Widow CniC

                CustomTextForm(
                  label: "Widow CNIC",
                  title: "Enter Widow CNIC",
                  controller: widowCnicController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Widow CNIC";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //TextFormField Husband cnic
                CustomTextForm(
                  label: "Husband CNIC",
                  controller: husbandCnicController,
                  title: "Enter Husband CNIC",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Husbamd CNIC";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                // File Pickers
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Death Certificate:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Upload Death Certificate",
                        style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Single File Picker Button
                    SingleFilePicker(
                      onFileSelected: (files) {
                        deathCertificate = [files];
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Affidavit:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Upload Affidavit",
                        style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Single File Picker Button
                    SingleFilePicker(
                      onFileSelected: (files) {
                        affidavte = [files];
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Gaurdian Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                //TextFormField Orphan name
                CustomTextForm(
                  title: "Enter Orphan Name",
                  label: "Orphan Name",
                  controller: orphanNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Orphan Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //TextFormField Father Name
                CustomTextForm(
                  title: "Enter Father Name",
                  label: "Father Name",
                  controller: fatherNameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Father Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                //TextFormField Phone Number
                CustomTextForm(
                  title: "Enter Phone Number",
                  label: "Phone Number",
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Phone Number";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Kids Information",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "How Many Kids.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    //Drop down menu of Kids
                    MyDropDownButton(
                      onValueChanged: (value) {
                        selectedDropdownValue = value;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Form B:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                //Multiple File Picker Button
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Upload Kids Form B",
                    style: TextStyle(
                        fontSize: 16,
                        //  fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: MultipleFilePicker(
                      onFilesSelected: (files) {
                        setState(() {
                          multipleSelectedFiles = files;
                        });
                      },
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Address",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  title: "Enter District Name",
                  label: "District Name",
                  controller: districtNameController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter District Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  title: "Enter Tehsil Name",
                  label: "Tehsil Name",
                  controller: tehsilNameController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Tehsil Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  title: "Enter Village Name",
                  label: "Village Name",
                  controller: villageNameController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Village Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                    title: "Submit",
                    onPressed: () {
                      FormSubmition.submitForm(
                        context: context,
                        widowNameController: widowNameController.toString(),
                        husbandNameControlle: husbandNameController.toString(),
                        phoneNoController: phoneNoController.toString(),
                        widowCnicController: widowCnicController.toString(),
                        husbandCnicController: husbandCnicController.toString(),
                        orphanNameController: orphanNameController.toString(),
                        fatherNameController: fatherNameController.toString(),
                        phoneNumberController: phoneNumberController.toString(),
                        districtNameController:
                            districtNameController.toString(),
                        tehsilNameController: tehsilNameController.toString(),
                        villageNameController: villageNameController.toString(),
                        deathCertificate: deathCertificate,
                        affidavte: affidavte,
                        multiFilePicker: multipleSelectedFiles,
                        dropDownValue: selectedDropdownValue,
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
