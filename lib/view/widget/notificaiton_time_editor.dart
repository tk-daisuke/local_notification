import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/item/notification_setting.dart';
import 'package:riverpod_test_application/service/notification_service.dart';

class NotificationTimeEditor extends StatelessWidget {
  const NotificationTimeEditor({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.timelapse),
        HookBuilder(builder: (context) {
          final _settings = useProvider(notificationSettingProvider);
          final _notificationTime = TimeOfDay(
              hour: _settings.state.hour, minute: _settings.state.minute);
          return Text(
            _notificationTime.format(context),
            textScaleFactor: 1,
            style: const TextStyle(fontSize: 24),
          );
        }),
        const SizedBox(
          width: 10,
        ),
        HookBuilder(builder: (context) {
          final _settings = useProvider(notificationSettingProvider);
          final _noticeTime = TimeOfDay(
              hour: _settings.state.hour, minute: _settings.state.minute);

          return ElevatedButton(
            child: const Text(
              'edit', textScaleFactor: 1,
              // style:
              //     TextStyle(decoration:
              // TextDecoration.overline),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              final timeOfDay = await showTimePicker(
                context: context,
                initialTime: _noticeTime,
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
          );
        }),
      ],
    );
  }
}
