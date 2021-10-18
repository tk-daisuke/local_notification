import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:riverpod_test_application/view/subscribe/subscribe_model.dart';

class NotificaitonTile extends StatelessWidget {
  const NotificaitonTile({
    Key? key,
    required this.stringPayload,
  }) : super(key: key);
  final String stringPayload;
  @override
  Widget build(BuildContext context) {
    final _model = SubscribeModel();
    final payload = _model.payloadConverter(stringPayload);

    final nextTime = _model.getRegisteredNotificationTime(
        payload.weekID, payload.hour, payload.minutes, payload.locationName);
    final registToTime = DateTime.parse(nextTime.toIso8601String()).toLocal();
    final localTime = DateFormat('yyyy年MM月dd日').format(registToTime);
    final localTime2 = DateFormat('HH時mm分').format(registToTime);
    return DefaultTextStyle(
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
        fontSize: 20,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Wrap(
                    children: [
                      Text('タイトル${payload.title}'),
                      if (payload.comment.isNotEmpty)
                        Text('コメント${payload.comment}'),
                    ],
                  ),
                  Wrap(
                    children: [
                      Text(localTime),
                      Text(localTime2),
                    ],
                  ),
                  if (payload.loopFlag)
                    const Text(
                      ' 毎週通知',
                      textScaleFactor: 1,
                    )
                  else
                    const Text(
                      ' 一回のみの通知',
                      textScaleFactor: 1,
                    )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: HookBuilder(builder: (context) {
                final _settings = useProvider(notificationSettingProvider);
                final _noticeTime = TimeOfDay(
                    hour: _settings.state.hour, minute: _settings.state.minute);

                return Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        await _model.deleteNotification(payload.notificationID);
                        context.refresh(providerGetNotificationList);
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('delete'),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                    ElevatedButton.icon(
                        onPressed: () async {
                          await _model.timeEdit(
                              context, _noticeTime, _settings);
                          await _model.editNotification(payload.notificationID,
                              payload.title, _settings, context);
                          context.refresh(providerGetNotificationList);
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('edit')),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
