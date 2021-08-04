import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:riverpod_test_application/view/root/root_model.dart';

class RootScreen extends HookWidget {
  const RootScreen({Key? key}) : super(key: key);
  static const String id = 'first_screen';

  @override
  Widget build(BuildContext context) {
    final _notification = useProvider(providerNotificationInitialization);

    return Scaffold(
        body: _notification.when(
      data: (boolValue) {
        print('notification $boolValue');
        useProvider(rootProvider).loginCheck(context);
      },
      loading: () => const _loading(),
      error: (e, stack) {
        print('error$e stack$stack');
        useProvider(rootProvider).loginCheck(context);
        return const _loading();
      },
    ));
  }
}

class _loading extends StatelessWidget {
  const _loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        semanticsLabel: 'Loading',
      ),
    );
  }
}
