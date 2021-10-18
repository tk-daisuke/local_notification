import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:riverpod_test_application/view/list/notification_add_model.dart';
import 'package:riverpod_test_application/view/widget/notificaiton_time_editor.dart';

class NotificationAddScreen extends HookWidget {
  const NotificationAddScreen({Key? key}) : super(key: key);
  static const String id = 'notification_add_screen';

  @override
  Widget build(BuildContext context) {
    final _model = NotificationAddModel();

    useProvider(notificaitonItems);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                await _model.cancelAllNotifications();
                context.refresh(providerGetNotificationList);
              },
              icon: const Icon(Icons.add),
              label: const Text('通知を全部キャンセル'),
            ),
            const SizedBox(
              height: 100,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add),
                Text(
                  '通知を登録する',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const Divider(),
            const NotificationTimeEditor(),
            Row(
              children: [
                const Text('コメント'),
                // const Icon(Icons.comment),
                Expanded(child: HookBuilder(builder: (context) {
                  final _settings =
                      useProvider(notificationSettingProvider.notifier);

                  return TextFormField(
                    onChanged: (value) {
                      print(_settings.state);
                      _settings.state =
                          _settings.state.copyWith(comment: value);
                    },
                  );
                })),
              ],
            ),
            HookBuilder(builder: (context) {
              final _settings = useProvider(notificationSettingProvider);
              final list = useProvider(notificaitonItems);

              return ElevatedButton(
                  onPressed: () async {
                    context.refresh(providerGetNotificationList);

                    await _model.addNotification(
                      list,
                      _settings,
                    );
                    context.refresh(providerGetNotificationList);
                  },
                  child: const Text('ADD NOTIFICATION'));
            }),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
