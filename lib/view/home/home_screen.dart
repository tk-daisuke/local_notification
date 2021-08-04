import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test_application/constants.dart';
import 'package:riverpod_test_application/service/auth_service.dart';
import 'package:riverpod_test_application/view/home/home_model.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

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
      onTap: (selectIndex) => _index.state = selectIndex,
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
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: kBottom3,
      ),
    ];
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(kAppName, style: GoogleFonts.poppins()),
      actions: [
        IconButton(
          onPressed: () {
            final _auth = AuthService(FirebaseAuth.instance);
            _auth.deleteUser(_auth.firebaseUser);
          },
          icon: const Icon(Icons.attribution_rounded),
        ),
      ],
    );
  }
}
