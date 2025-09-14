import 'package:e_commerce_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(title: const Text("Login")),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.login,
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () => Get.toNamed(Routes.SIGNUP),
              child: const Text("Don’t have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
