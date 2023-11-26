import 'package:bmi_calculator/modules/bmi/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: getTitleText(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  getDefaultTextField(
                      controller: _emailController,
                      label: "Email Address",
                      prefix: Icons.email,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        }

                        return null;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  getDefaultTextField(
                      controller: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Icons.lock,
                      suffix: Icons.remove_red_eye,
                      label: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }

                        return null;
                      }),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(20)),
                      color: Colors.blue,
                    ),
                    child: MaterialButton(
                        textColor: Colors.white,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (_emailController.text == "ezz" &&
                                _passwordController.text == "ezz") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BMIScreen()));
                            } else {
                              Toast.show("Invalid Email Address or Password",
                                  duration: Toast.lengthShort,
                                  gravity: Toast.bottom);
                            }
                          }
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 21,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          "Register Now",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => Toast.show("Register Process",
                            duration: Toast.lengthShort, gravity: Toast.bottom),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
