import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/notification_service.dart';

class SubscribeScreen extends HookWidget {
  const SubscribeScreen({Key? key}) : super(key: key);
  static const String id = 'subscribe_screen';

  @override
  Widget build(BuildContext context) {
    final notificationService = useProvider(notificationProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        useProvider(providerGetNotificationList).when(
            loading: () => const SizedBox(
                  height: 4000,
                ),
            error: (e, stack) => Text(e.toString()),
            data: (snapshot) => Text('data')),
        FutureBuilder(
          future: notificationService.getNotificationList(),
          builder: (BuildContext context,
              AsyncSnapshot<List<PendingNotificationRequest>> snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data;
              final item = list!.map((doc) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${doc.id}'),
                    Text('${doc.title}'),
                    Text('${doc.payload}'),
                    Text('${doc.body}'),
                  ],
                );
              }).toList();
              return Column(
                children: item,
              );
            } else {
              return const Text('データが存在しません');
            }
          },
        ),
        Container(
          child: const Center(child: const Text('subscribe')),
        ),
      ],
    );
  }
}
