import 'package:flutter/material.dart';
import 'package:orphankor/Components/button.dart';
import 'package:orphankor/Components/drawer.dart';
import 'package:orphankor/Components/drop_down_button.dart';
import 'package:orphankor/Components/file_picker.dart';
import 'package:orphankor/Components/multiple_file_picker.dart';
import 'package:orphankor/Components/textform_email.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
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
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Death Certificate:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Upload Death Certificate",
                        style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Single File Picker Button
                    FormButton(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Affidavit:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Upload Affidavit",
                        style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Single File Picker Button
                    FormButton(),
                    SizedBox(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "How Many Kids.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    //Drop down menu of Kids
                    MyDropDownButton(),
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
                const Align(
                    alignment: Alignment.centerLeft,
                    child: MultipleFilePicker()),
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
                CustomButton(title: "Submit", onPressed: () {}),
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
