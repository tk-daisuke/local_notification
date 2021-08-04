import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/auth_service.dart';
import 'package:riverpod_test_application/view/root/root_screen.dart';

final welcomeProvider = ChangeNotifierProvider((ref) => WelcomeModel());

class WelcomeModel extends ChangeNotifier {
  final _auth = AuthService(FirebaseAuth.instance);
  String _infoText = '';
  void firebaseErrorSelector(FirebaseAuthException e) {
    _infoText = '';
    switch (e.code) {
      case 'requires-recent-login':
        _infoText = 'この操作をするには再認証が必要です';
        break;
      case 'missing-email':
        _infoText = 'メールアドレスに問題があります';
        break;
      case 'email-already-in-use':
        _infoText = 'そのメールアドレスは既に存在します';
        break;
      // case 'weak-password':
      //   infoText = '脆弱なパスワードです';
      //   break;
      case 'sign_in_canceled':
        _infoText = 'キャンセルしました';
        break;
      case 'error-invalid-email':
        _infoText = 'メールアドレスの形式が間違っています';
        break;
      case 'missing-email':
        _infoText = 'そのメールのアカウントは既に存在します';
        break;
      case 'user-not-found':
        _infoText = 'そのアカウントは存在しません';
        break;
      case 'requires-recent-login':
        _infoText = 'この操作をするには再認証が必要です';
        break;
      case 'network-request-failed':
        _infoText = '接続が切れました';
        break;
      case 'too-many-requests': //異常なアクティビティが原因
        _infoText = '接続エラー';
        break;
      case 'credential-already-in-use':
        _infoText = 'この資格情報は、すでに別のユーザーアカウントに関連付けられています。';
        break;
    }
  }

  Future<void> signUp(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress!.show();
    await _auth.signUpAnonymously().then((value) => print(value.user!.uid))
        // ignore: unnecessary_lambdas
        .catchError((e) {
      progress.dismiss;

      firebaseErrorSelector(e);
      final snackBar = SnackBar(content: Text(_infoText));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(e);
    });

    if (await _auth.isAuthStateChanged.first != null) {
      Future.delayed(Duration.zero, () {
        progress.dismiss;
        const snackBarSignup = const SnackBar(content: const Text('登録しました'));
        ScaffoldMessenger.of(context).showSnackBar(snackBarSignup);
        Navigator.pushNamedAndRemoveUntil(
            context, RootScreen.id, (route) => false);
      });
    } else {
      progress.dismiss;
      const SnackBar(content: const Text('error'));
    }
  }
}
