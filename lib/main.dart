import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/service/initialize.dart';
import 'package:riverpod_test_application/view/home/home_screen.dart';
import 'package:riverpod_test_application/view/list/notification_add_screen.dart';
import 'package:riverpod_test_application/view/notification_result/notification_result_screen.dart';
import 'package:riverpod_test_application/view/setting/setting_screen.dart';
import 'package:riverpod_test_application/view/subscribe/subscribe_sceen.dart';

Future<void> main() async {
  final initialize = Initialize();

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await Future.wait([
    // initialize.firebaseEmulator(isEmulator: isEmulator),
    // initialize.firebaseLoginCheck(),
    initialize.configureLocalTimeZone(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]);

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF212332),
        textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData(brightness: Brightness.dark).textTheme),

        canvasColor: Colors.grey[800],
        secondaryHeaderColor: Colors.white,
        // accentColor: Colors.cyan[600],
      ),
      // navigatorObservers: [
      //   AnalyticsService.observer,
      // ],
      initialRoute: HomeScreen.id,
      routes: {
        // RootScreen.id: (context) => const RootScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        // WelcomeScreen.id: (context) => const WelcomeScreen(),
        SettingScreen.id: (context) => const SettingScreen(),
        SubscribeScreen.id: (context) => const SubscribeScreen(),
        NotificationAddScreen.id: (context) => const NotificationAddScreen(),
      },
    );
  }
}
