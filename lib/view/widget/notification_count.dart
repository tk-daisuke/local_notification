import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/notification_service.dart';

class NotificationCount extends StatelessWidget {
  const NotificationCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      return Text(
        '通知数${useProvider(notificaitonItems).state.length}/ 64',
        style: const TextStyle(fontSize: 25),
      );
    });
  }
}