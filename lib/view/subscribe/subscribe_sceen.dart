import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:riverpod_test_application/view/widget/notification_count.dart';
import 'package:riverpod_test_application/view/widget/notification_tile.dart';

class SubscribeScreen extends HookWidget {
  const SubscribeScreen({Key? key}) : super(key: key);
  static const String id = 'subscribe_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NotificationCount(),
              useProvider(providerGetNotificationList).when(
                  loading: () => const SizedBox(
                        height: 4000,
                      ),
                  error: (e, stack) => Text(e.toString()),
                  data: (snapshot) {
                    final sortSnapshot = snapshot
                      ..sort((a, b) => a.id.compareTo(b.id));
                    final list = buildNotificationList(
                      sortSnapshot,
                    );
                    return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return list[index];
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNotificationList(
    List<PendingNotificationRequest> sortSnapshot,
  ) {
    final list = sortSnapshot.map((e) {
      return e.payload != null
          ? NotificaitonTile(
              stringPayload: e.payload!,
            )
          : const Text('error');
    }).toList();
    return list;
  }
}
