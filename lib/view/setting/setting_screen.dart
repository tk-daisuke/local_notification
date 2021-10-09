import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const String id = 'setting_screen';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.ac_unit,
            ),
          ),
        ),
        const Center(child: Text('setting')),
      ],
    );
  }
}
