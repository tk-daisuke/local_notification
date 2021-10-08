import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/item/notification_value.dart';
import 'package:riverpod_test_application/service/notification_service.dart';

class ListScreen extends HookWidget {
  const ListScreen({Key? key}) : super(key: key);
  static const String id = 'list_screen';

  @override
  Widget build(BuildContext context) {
    final notificationService = useProvider(notificationProvider);
    final _size = MediaQuery.of(context).size;
    final list = useProvider(notificaitonItems);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: _size.height / 4,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await notificationService.cancelAllNotifications();
              },
              icon: const Icon(Icons.add),
              label: const Text('通知を全部キャンセル'),
            ),
            ElevatedButton(
                onPressed: () async {
                  final value = NotificationValue(
                      notificationID: list.state.length + 1,
                      weekID: DateTime.monday,
                      hour: 1,
                      minutes: 2,
                      title: 'title',
                      comment: 'comment',
                      loopFlag: true);

                  await notificationService.schedulenotification(
                    value: value,
                  );
                  context.refresh(providerGetNotificationList);
                },
                child: const Text('ADD NOTIFICATION')),
            const Text('list'),
            SizedBox(
              height: _size.height / 4,
            ),
          ],
        ),
      ),
    );
  }
}

class _button extends StatelessWidget {
  const _button({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.add),
      label: Text(name),
    );
  }
}
