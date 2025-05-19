import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google & Facebook Login")),
      body: Center(
        child: Obx(() {
          if (controller.isLoggedIn) {
            final user = controller.user.value!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundImage: NetworkImage(user['photo'] ?? ''), radius: 40),
                SizedBox(height: 10),
                Text(user['name'] ?? '', style: TextStyle(fontSize: 20)),
                Text(user['email'] ?? ''),
                SizedBox(height: 20),
                ElevatedButton(onPressed: controller.logout, child: Text("Logout")),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: controller.logIN, icon: const Icon(Icons.people, size: 100)),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: Icon(Icons.login),
                  label: Text("Login with Google"),
                  onPressed: controller.loginWithGoogle,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: Icon(Icons.facebook),
                  label: Text("Login with Facebook"),
                  onPressed: controller.loginWithFacebook,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
