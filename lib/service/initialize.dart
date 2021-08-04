import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Initialize {
  Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<void> firebaseEmulator({required bool isEmulator}) async {
    if (isEmulator) {
      print('isEmulator$isEmulator');
      const localhost = 'localhost';

      FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);
      await Future.wait(
        [FirebaseAuth.instance.useAuthEmulator(localhost, 9099)],
      );
    }
  }

  Future<void> firebaseLoginCheck() async {
    if (kDebugMode) {
      await FirebaseAuth.instance
          .userChanges()
          .listen((final User? _firebaseUser) {
        if (_firebaseUser != null) {
          print(_firebaseUser);
          print('User sign in');
        } else {
          print(_firebaseUser);
          print('User sign out');
        }
      });
    } else {
      final _user = await FirebaseAuth.instance.userChanges();

      print('MAIN${_user.first}');
    }
  }
}
