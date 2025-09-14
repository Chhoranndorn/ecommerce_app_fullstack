import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Email"),
              onChanged: (val) => controller.email.value = val,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (val) => controller.password.value = val,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
              onChanged: (val) => controller.confirmPassword.value = val,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.signup,
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
