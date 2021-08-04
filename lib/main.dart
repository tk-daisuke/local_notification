import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/firebase_analytics.dart';
import 'package:riverpod_test_application/service/initialize.dart';
import 'package:riverpod_test_application/view/list/list_screen.dart';
import 'package:riverpod_test_application/view/root/root_screen.dart';
import 'package:riverpod_test_application/view/home/home_screen.dart';
import 'package:riverpod_test_application/view/setting/setting_screen.dart';
import 'package:riverpod_test_application/view/subscribe/subscribe_sceen.dart';
import 'package:riverpod_test_application/view/welcome/welcome_screen.dart';
import 'package:simple_logger/simple_logger.dart';

Future<void> main() async {
  final initialize = Initialize();

  // FlutterアプリからFirebaseエミュレーターに接続
// https://medium.com/flutter-jp/firebase-emulator-938e9a0cdfad
  final logger = SimpleLogger();
  const isEmulator = bool.fromEnvironment('IS_EMULATOR');
  logger.fine('start(isEmulator: $isEmulator)');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialize.firebaseEmulator(isEmulator: isEmulator);
  await initialize.firebaseLoginCheck();
  await initialize.configureLocalTimeZone();

  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF212332),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: Colors.grey[800],
        accentColor: Colors.cyan[600],
        // Colors.amberAccent
      ),
      navigatorObservers: [
        AnalyticsService.observer,
      ],
      initialRoute: RootScreen.id,
      routes: {
        RootScreen.id: (context) => const RootScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        SettingScreen.id: (context) => const SettingScreen(),
        SubscribeScreen.id: (context) => const SubscribeScreen(),
        ListScreen.id: (context) => const ListScreen(),
      },
    );
  }
}
