import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/notification_service.dart';

class ListScreen extends HookWidget {
  const ListScreen({Key? key}) : super(key: key);
  static const String id = 'list_screen';

  @override
  Widget build(BuildContext context) {
    final notificationService = useProvider(notificationProvider);
    final _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _size.height / 4,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  await notificationService.showInstantNotification();
                },
                icon: const Icon(Icons.add),
                label: const Text('簡単な通知'),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  await notificationService.show5SecondsNotification();
                },
                icon: const Icon(Icons.add),
                label: const Text('スケジュール通知'),
              ),
              const Text('10時'),
              _weeklyButtons(notificationService: notificationService),
              ElevatedButton.icon(
                onPressed: () async {
                  await notificationService.cancelAllNotifications();
                },
                icon: const Icon(Icons.add),
                label: const Text('通知を全部キャンセル'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.ac_unit,
                ),
              ),
              const Text('list'),
              SizedBox(
                height: _size.height / 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _weeklyButtons extends StatelessWidget {
  const _weeklyButtons({
    Key? key,
    required this.notificationService,
  }) : super(key: key);

  final NotificationService notificationService;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _button(
            name: '月',
            onPressed: () => notificationService.schedulenotification(
                notificationID: 0, hour: 10, weekly: notificatinWeek.monday)),
        _button(
            name: '火',
            onPressed: () => notificationService.schedulenotification(
                notificationID: 1, hour: 10, weekly: notificatinWeek.thursday)),
        _button(
            name: '水',
            onPressed: () => notificationService.schedulenotification(
                notificationID: 2,
                hour: 10,
                weekly: notificatinWeek.wednesday)),
        _button(
            name: '木',
            onPressed: () => notificationService.schedulenotification(
                notificationID: 3, hour: 10, weekly: notificatinWeek.saturday)),
        _button(
            name: '金',
            onPressed: () => notificationService.schedulenotification(
                notificationID: 4, hour: 10, weekly: notificatinWeek.friday)),
        _button(
            name: '土',
            onPressed: () => notificationService.schedulenotification(
                notificationID: 5, hour: 10, weekly: notificatinWeek.saturday)),
        _button(
            name: '日',
            onPressed: () => notificationService.schedulenotification(
                notificationID: 6, hour: 10, weekly: notificatinWeek.monday)),
      ],
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
