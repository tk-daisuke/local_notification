import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/constants.dart';
import 'package:riverpod_test_application/service/url.dart';
import 'package:riverpod_test_application/view/welcome/welcome_model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return ProgressHUD(
      child: Builder(
          builder: (context) => Scaffold(
                bottomNavigationBar: const _bottomBar(),
                body: SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('R',
                        style: GoogleFonts.shojumaru(
                          fontSize: 100,
                        )),
                    SizedBox(
                      height: _size.height * 0.02,
                    ),
                    const Center(
                      child: const Text(kAppName),
                    ),
                    const _signUp(),
                  ],
                )),
              )),
    );
  }
}

class _signUp extends HookWidget {
  const _signUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = useProvider(welcomeProvider);
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.login,
      ),
      label: const Text('登録する'),
      // style: ElevatedButton.styleFrom(),
      onPressed: () async {
        await _model.signUp(context);
      },
    );
  }
}

class _bottomBar extends StatelessWidget {
  const _bottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _url = UrlLaunch();
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => _url.launchURL(kTermsofService),
            child: const Text(
              '利用規約',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _url.launchURL(kPrivacyPolicy),
            child: const Text(
              'プライバシーポリシー',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
