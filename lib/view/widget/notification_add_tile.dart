import 'package:flutter/material.dart';

class NotificationAddTile extends StatelessWidget {
  const NotificationAddTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.child,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 100,
              child: Row(
                children: [
                  Icon(icon),
                  Flexible(
                    child: Text(
                      title,
                      textScaleFactor: 1,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
          Expanded(child: child),
        ],
      ),
    );
  }
}
