import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/view/list/notification_add_screen.dart';
import 'package:riverpod_test_application/view/subscribe/subscribe_sceen.dart';

final bottomIndex = StateProvider<int>((ref) => 0);
final homeProvider = ChangeNotifierProvider((ref) => HomeModel());

class HomeModel extends ChangeNotifier {
  final pageWidgets = [
    const NotificationAddScreen(),
    const SubscribeScreen(),
    // const SettingScreen()
  ];
}
