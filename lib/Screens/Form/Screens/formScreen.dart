import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orphankor/Screens/Form/Screens/completionScreen.dart';
import '../../../Components/customButton.dart';
import '../../../Components/customTextForm.dart';
import '../../../Components/dropDownButton.dart';
import '../../../Components/filePicker.dart';
import '../../../Components/homeDrawer.dart';
import '../../../Components/multipleFilePicker.dart';
import '../../../Models/Form/addingFormModel.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  final formkey = GlobalKey<FormState>();
  final widowNameController = TextEditingController();
  final husbandNameController = TextEditingController();
  final widowPhoneNoController = TextEditingController();
  final widowCnicController = TextEditingController();
  final husbandCnicController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final relationController = TextEditingController();
  final gaurdianNameController = TextEditingController();
  final gaurdianPhoneNumberController = TextEditingController();
  final districtNameController = TextEditingController();
  final tehsilNameController = TextEditingController();
  final villageNameController = TextEditingController();
  List<Map<String, dynamic>> deathCertificate = [];
  List<Map<String, dynamic>> affidavte = [];
  List<Map<String, dynamic>> bForm = [];
  String kids = '0';
  //print("updated $selectedDropdownValue");
  bool isAffidavitUploaded = true;
  bool isDeathCertificateUploaded = true;
  bool isBFormUploaded = true;
  bool isKidsSelected = true;

  bool validateFiles() {
    if (affidavte.isEmpty ||
        deathCertificate.isEmpty ||
        bForm.isEmpty ||
        !isKidsSelected) {
      if (affidavte.isEmpty) {
        isAffidavitUploaded = false;
      } else {
        isAffidavitUploaded = true;
      }
      if (deathCertificate.isEmpty) {
        isDeathCertificateUploaded = false;
      } else {
        isDeathCertificateUploaded = true;
      }
      if (bForm.isEmpty) {
        isBFormUploaded = false;
      } else {
        isBFormUploaded = true;
      }
      if (kids == '0') {
        isKidsSelected = false;
      } else {
        isKidsSelected = true;
      }
      setState(() {});

      return false;
    }
    setState(() {
      isDeathCertificateUploaded = true;
      isAffidavitUploaded = true;
      isBFormUploaded = true;
      isKidsSelected = true;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  controller: widowPhoneNoController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 11) {
                      return "Phone Number must be 11 digit";
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
                    if (value == null || value.isEmpty || value.length < 13) {
                      return "CNIC must be 13 digit";
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
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 13) {
                      return "CNIC must be 13 digit";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  label: "Email",
                  title: "Enter Email ",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  label: "Password",
                  title: "Enter Password ",
                  isPassField: true,
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Password";
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        isDeathCertificateUploaded
                            ? "Upload Death Certificate"
                            : "Death Certificate is required?",
                        style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: isDeathCertificateUploaded
                                ? Colors.black
                                : Colors.red[700]),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Single File Picker Button
                    SingleFilePicker(
                      onFilesSelected: (files) {
                        deathCertificate = files;
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        isAffidavitUploaded
                            ? "Upload Affidavit"
                            : "Affidavit is required",
                        style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold,
                            color: isAffidavitUploaded
                                ? Colors.black
                                : Colors.red[700]),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Single File Picker Button
                    SingleFilePicker(
                      onFilesSelected: (files) {
                        affidavte = files;
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

                //TextFormField Father Name
                CustomTextForm(
                  title: "Guardian Full Name",
                  label: "Widow Name",
                  controller: gaurdianNameController,
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
                CustomTextForm(
                  title: "Enter Husband Name",
                  label: "Husband Name",
                  controller: relationController,
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
                //TextFormField Phone Number
                CustomTextForm(
                  title: "Enter Phone Number",
                  label: "Phone Number",
                  controller: gaurdianPhoneNumberController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 11) {
                      return "Phone Number must be 11 digit";
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
                    !isKidsSelected
                        ? Text(
                            'Kids are required?',
                            style: TextStyle(color: Colors.red[700]),
                          )
                        : const Text(''),
                    //Drop down menu of Kids
                    MyDropDownButton(
                      onValueChanged: (value) {
                        kids = value;
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    isBFormUploaded
                        ? "Upload Kids Form B"
                        : "Form Bs are required",
                    style: TextStyle(
                        fontSize: 16,
                        //  fontWeight: FontWeight.bold,
                        color:
                            isBFormUploaded ? Colors.black : Colors.red[700]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MultipleFilePicker(
                    onFilesSelected: (files) {
                      bForm = files;
                    },
                  ),
                ),
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
                  keyboardType: TextInputType.text,
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
                  keyboardType: TextInputType.text,
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
                  keyboardType: TextInputType.text,
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
                      var isFileValidated = validateFiles();
                      if (formkey.currentState!.validate()) {
                        if (!isFileValidated) return;
                        FormSubmition.submitForm(
                          context: context,
                          widowNameController:
                              widowNameController.text.toString(),
                          husbandNameControlle:
                              husbandNameController.text.toString(),
                          emailController: emailController.text.toString(),
                          passwordController:
                              passwordController.text.toString(),
                          widowphoneNoController:
                              widowPhoneNoController.text.toString(),
                          widowCnicController:
                              widowCnicController.text.toString(),
                          husbandCnicController:
                              husbandCnicController.text.toString(),
                          relationController:
                              relationController.text.toString(),
                          gaurdianNameController:
                              gaurdianNameController.text.toString(),
                          gaurdianphoneNumberController:
                              gaurdianPhoneNumberController.text.toString(),
                          districtNameController:
                              districtNameController.text.toString(),
                          tehsilNameController:
                              tehsilNameController.text.toString(),
                          villageNameController:
                              villageNameController.text.toString(),
                          deathCertificate: deathCertificate,
                          affidavte: affidavte,
                          bForms: bForm,
                          kids: kids,
                        );
                        Fluttertoast.showToast(
                            msg: 'Form submitted successfuly');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccessScreen()));
                      }
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
