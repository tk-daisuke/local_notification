import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/item/notification_setting.dart';
import 'package:riverpod_test_application/service/notification_service.dart';

class NotificationTimeEditor extends HookWidget {
  const NotificationTimeEditor({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _settings = useProvider(notificationSettingProvider);

    final _notificationTime =
        TimeOfDay(hour: _settings.state.hour, minute: _settings.state.minute);
    return InkWell(
      onTap: () async {
        final timeOfDay = await showTimePicker(
          context: context,
          initialTime: _notificationTime,
        );
        if (timeOfDay != null) {
          _settings.state = NotificationSetting(
              hour: timeOfDay.hour,
              minute: timeOfDay.minute,
              loopFlag: _settings.state.loopFlag,
              comment: _settings.state.comment,
              weekID: _settings.state.weekID);
        }
      },
      child: NotificationAddTile(
        title: '時間',
        icon: Icons.timelapse,
        child: Row(
          children: [
            Text(
              _notificationTime.format(context),
              textScaleFactor: 1,
              style: const TextStyle(fontSize: 24),
            ),
            // Icon(Icons.forward_to_inbox_sharp)
          ],
        ),
      ),
    );
  }
}

class NotificationAddTile extends StatelessWidget {
  const NotificationAddTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.child,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 100,
              child: Row(
                children: [
                  Icon(icon),
                  Text(
                    title,
                    textScaleFactor: 1,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              )),
          Expanded(child: child),
        ],
      ),
    );
  }
}
