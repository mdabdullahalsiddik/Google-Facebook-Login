import 'dart:developer';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var user = Rxn<Map<String, dynamic>>();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // Google Login
  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        user.value = {'name': googleUser.displayName, 'email': googleUser.email, 'photo': googleUser.photoUrl, 'loginType': 'google'};
      }
    } catch (e) {
      Get.snackbar("Google Login Failed", e.toString());
      log("Google Login Error: $e");
    }
  }

  // Facebook Login
  Future<void> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final fbUser = await FacebookAuth.instance.getUserData();
        user.value = {'name': fbUser['name'], 'email': fbUser['email'], 'photo': fbUser['picture']['data']['url'], 'loginType': 'facebook'};
      } else {
        Get.snackbar("Facebook Login Failed", result.message ?? '');
      }
    } catch (e) {
      Get.snackbar("Facebook Login Error", e.toString());
    }
  }

  // Logout
  Future<void> logout() async {
    if (user.value?['loginType'] == 'google') {
      await _googleSignIn.signOut();
    } else if (user.value?['loginType'] == 'facebook') {
      await FacebookAuth.instance.logOut();
    }
    user.value = null;
  }

  bool get isLoggedIn => user.value != null;
}
