import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/auth_service.dart';
import 'package:riverpod_test_application/view/home/home_screen.dart';
import 'package:riverpod_test_application/view/welcome/welcome_screen.dart';

final rootProvider = ChangeNotifierProvider((ref) => RootModel());

class RootModel extends ChangeNotifier {
  final _auth = AuthService(FirebaseAuth.instance);

  Future<void> loginCheck(BuildContext context) async {
    final _userStream = await _auth.isAuthStateChanged;
    print('root');
    if (await _userStream.first != null) {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacementNamed(context, HomeScreen.id),
      );
    } else {
      Future.delayed(Duration.zero,
          () => Navigator.pushReplacementNamed(context, WelcomeScreen.id));
    }
  }
}
