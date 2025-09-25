
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(() => Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passCtrl, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      controller.login(emailCtrl.text, passCtrl.text);
                    },
                    child: Text("Login"),
                  ),
                   TextButton(
              onPressed: () => Get.toNamed('/signup'),
              child: Text("Don’t have an account? Register"),
            )
          ],
        )),
      ),
    );
  }
}
