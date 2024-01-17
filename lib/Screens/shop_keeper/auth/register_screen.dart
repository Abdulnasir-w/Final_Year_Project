import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orphankor/Components/button.dart';
import 'package:orphankor/Components/textform_email.dart';
import 'package:orphankor/Models/ShopKeeper/register/register_to_shopkeeper.dart';
import 'package:orphankor/Screens/shop_keeper/auth/login_screen.dart';
import 'package:orphankor/Utils/flutter_toast.dart';

class ShopKeeperRegister extends StatelessWidget {
  ShopKeeperRegister({super.key});

  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Register Shopkeeper",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffFFFFFF),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset(
                "assets/login/login.png",
                height: 250,
                width: 700,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Register",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
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
                        height: 20,
                      ),
                      CustomTextForm(
                        title: "Enter a Email",
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
                        },
                        prefixIcon: Icons.email_outlined,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextForm(
                        title: "Enter a Password",
                        label: "Password",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                        prefixIcon: Icons.lock_outline_rounded,
                        isPassField: true,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextForm(
                        title: "Confirm Password",
                        label: "Confirm Password",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm Password";
                          }
                          return null;
                        },
                        prefixIcon: Icons.lock_outline_rounded,
                        isPassField: true,
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: "Register",
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    if (passwordController.toString() ==
                        passwordConfirmController.toString()) {
                      RegisterShopkeeper.registerUser(
                        context: context,
                        name: nameController.toString(),
                        email: emailController.toString(),
                        password: passwordController.toString(),
                      );
                      ToastUtils.showToast("Register Successfully");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopKeeperLogin(),
                        ),
                      );
                    } else {
                      ToastUtils.showToast("Password is not Matching");
                    }
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account?",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopKeeperLogin(),
                            ));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
