import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/constants.dart';
import 'package:riverpod_test_application/service/notification_service.dart';
import 'package:riverpod_test_application/view/home/home_model.dart';
import 'package:riverpod_test_application/view/notification_result/notification_result_screen.dart';

class HomeScreen extends StatefulHookWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final _notificationsPlugin = FlutterLocalNotificationsPlugin();
    const _androidSettings = AndroidInitializationSettings('ic_notice');
    //  iOSフォアグラウンド通知を有効にするにはalertをtrueにする
    const _iOSSettings = IOSInitializationSettings();
    const _notificationInitSetting =
        InitializationSettings(android: _androidSettings, iOS: _iOSSettings);
    // final _model = HomeModel();
    // final init =
    _notificationsPlugin.initialize(_notificationInitSetting,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        // ネスト防止
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => NotificationResultScreen(payload: payload)),
          ModalRoute.withName(HomeScreen.id),
        );

        context.refresh(providerGetNotificationList);
      }
    });
    _notificationsPlugin.getNotificationAppLaunchDetails().then((value) async {
      if (value!.payload != null) {
        print('value${value.payload}');
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  NotificationResultScreen(payload: value.payload!)),
        );
        context.refresh(providerGetNotificationList);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _index = useProvider(bottomIndex);
    final _model = useProvider(homeProvider.notifier);
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _buttomNavigator(_index),
      body: _model.pageWidgets.elementAt(_index.state),
    );
  }

  Widget _buttomNavigator(StateController<int> _index) {
    return BottomNavigationBar(
      selectedItemColor: kSelectedBottomItemColor,
      unselectedItemColor: kUnselectedBottomItemColor,
      items: _bottomButton,
      currentIndex: _index.state,
      onTap: (selectIndex) {
        if (selectIndex != _index.state) {
          context.refresh(providerGetNotificationList);
        }
        _index.state = selectIndex;
      },
    );
  }

  List<BottomNavigationBarItem> get _bottomButton {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: kBottom1,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: kBottom2,
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.settings),
      //   label: kBottom3,
      // ),
    ];
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(kAppName, style: GoogleFonts.poppins()),
    );
  }
}
