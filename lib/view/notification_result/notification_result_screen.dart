import 'package:flutter/material.dart';
import 'package:riverpod_test_application/view/widget/notification_tile.dart';

class NotificationResultScreen extends StatelessWidget {
  const NotificationResultScreen({Key? key, required this.payload})
      : super(key: key);
  static const String id = 'notification_result_screen';
  final String payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            NotificaitonTile(
              stringPayload: payload,
            )
          ]),
        ),
      ),
    );
  }
}
