import 'package:flutter/material.dart';

class WindowBar extends StatelessWidget implements PreferredSizeWidget {
  const WindowBar({super.key, required this.logo, required this.title});

  final Widget logo;
  final Widget title;

  @override
  Size get preferredSize => const Size.fromHeight(40.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 9, right: 9),
          child: logo,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9, right: 9),
          child: title,
        ),
        Expanded(child: Container()),
      ]),
    );
  }
}
