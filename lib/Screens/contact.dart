import 'package:flutter/material.dart';
import 'package:orphankor/Components/button.dart';
import 'package:orphankor/Components/textform_email.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Components/drawer.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

final _formkey = GlobalKey<FormState>();
final nameController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();
Future sendEmail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_8u4a1xa";
  const templateId = "template_fe38z6t";
  const userId = "KEUDdnb4gz5LwHepn";
  try {
    final response = await http.post(url,
        headers: {
          "Content-Type": 'application/json',
          "Authorization": "KEUDdnb4gz5LwHepn"
        },
        body: json.encode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": nameController.text,
            "subject": nameController.text,
            "user_email": emailController.text,
            "message": messageController.text,
          }
        }));
    if (response.statusCode == 200) {
      print("succsess");
    } else {
      print("Request failed with status: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  } catch (e) {
    print("error");
  }
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("Contact Us"),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.grey[400],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          const Text(
                            "Contact Us",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextForm(
                            controller: nameController,
                            title: 'Name',
                            keyboardType: TextInputType.name,
                            prefixIcon: Icons.person_2_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextForm(
                            controller: emailController,
                            title: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextForm(
                            controller: messageController,
                            title: 'Type a Message',
                            keyboardType: TextInputType.emailAddress,
                            //prefixIcon: Icons.message_outlined,
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Message";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            title: 'Send',
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                sendEmail();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
