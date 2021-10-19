import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:riverpod_test_application/view/list/notification_add_model.dart';
import 'package:riverpod_test_application/view/widget/notificaiton_time_editor.dart';
import 'package:riverpod_test_application/view/widget/notification_add_tile.dart';

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
            const _WeekSelector(),
            const NotificationTimeEditor(),
            // [iOS] [シミュレーター]：ソフトウェアキーボードを 切り替えようとすると、
            // 最新のマスターとベータ版で未処理の例外がスローされます＃89378
            // https://github.com/flutter/flutter/issues/89378
            const _CommentForm(),
            const _LoopFlag(),
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

class _LoopFlag extends StatelessWidget {
  const _LoopFlag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final _settings = useProvider(notificationSettingProvider);

      return NotificationAddTile(
        icon: Icons.loop,
        title: '',
        child: Row(
          children: [
            const Text('毎週繰り返す'),
            Switch(
                value: _settings.state.loopFlag,
                onChanged: (on) {
                  _settings.state = _settings.state.copyWith(loopFlag: on);
                }),
          ],
        ),
      );
    });
  }
}

class _WeekSelector extends StatelessWidget {
  const _WeekSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = NotificationAddModel();

    return HookBuilder(builder: (context) {
      final _settings = useProvider(notificationSettingProvider);
      var weekID = DateTime.sunday;

      return PopupMenuButton<String>(
        child: NotificationAddTile(
            icon: Icons.calendar_today,
            title: 'title',
            child: Text(_model.weekList[_settings.state.weekID - 1])),
        onSelected: (String value) {
          weekID = _model.getWeekID(value);
          _settings.state = _settings.state.copyWith(weekID: weekID);
        },
        itemBuilder: (BuildContext context) {
          return _model.weekList.map((String value) {
            return PopupMenuItem(
              child: Text(value),
              value: value,
            );
          }).toList();
        },
      );
    });
  }
}

class _CommentForm extends StatelessWidget {
  const _CommentForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationAddTile(
      icon: Icons.comment,
      title: 'コメント',
      child: HookBuilder(builder: (context) {
        final _settings = useProvider(notificationSettingProvider.notifier);
        final _textNode1 = FocusNode();
        KeyboardActionsConfig _buildConfig(BuildContext context) {
          return KeyboardActionsConfig(
            keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
            keyboardBarColor: Colors.grey[200],
            nextFocus: true,
            actions: [
              KeyboardActionsItem(
                focusNode: _textNode1,
                toolbarButtons: [
                  (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'DONE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                ],
              ),
            ],
          );
        }

        return KeyboardActions(
          config: _buildConfig(context),
          child: TextFormField(
            keyboardType: TextInputType.text,
            focusNode: _textNode1,
            onChanged: (value) {
              _settings.state = _settings.state.copyWith(comment: value);
            },
          ),
        );
      }),
    );
  }
}
