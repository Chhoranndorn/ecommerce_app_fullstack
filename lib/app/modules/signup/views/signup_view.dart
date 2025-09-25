import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(() => Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passCtrl,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      controller.register(
                        nameCtrl.text,
                        emailCtrl.text,
                        passCtrl.text,
                      );
                    },
                    child: Text("Sign Up"),
                  ),
            TextButton(
              onPressed: () => Get.offAllNamed('/login'),
              child: Text("Already have an account? Login"),
            )
          ],
        )),
      ),
    );
  }
}
