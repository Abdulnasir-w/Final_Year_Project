import 'package:flutter/material.dart';
import '../../../Components/customButton.dart';
import '../../../Components/customTextForm.dart';
import '../../../Models/ShopKeeper/Login/shopKeeperLogin.dart';

class ShopKeeperLogin extends StatelessWidget {
  ShopKeeperLogin({super.key});

  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "Shopkeeper Login",
            //style: TextStyle(color: Colors.white),
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
                "Login",
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                title: "Login",
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    ShopkeeperAuthLogin.loginUser(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text);
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
