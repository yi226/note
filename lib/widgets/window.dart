import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:note/utils/io.dart' as io;

class WindowBar extends StatelessWidget implements PreferredSizeWidget {
  const WindowBar({super.key, required this.logo, required this.title});

  final Widget logo;
  final Widget title;

  @override
  Size get preferredSize => const Size.fromHeight(40.0);

  @override
  Widget build(BuildContext context) {
    if (io.isDesktop) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Row(children: [
          WindowTitleBarBox(
            child: MoveWindow(
                child: Padding(
              padding: const EdgeInsets.only(left: 9, right: 9),
              child: logo,
            )),
          ),
          WindowTitleBarBox(
            child: MoveWindow(
              child: Padding(
                padding: const EdgeInsets.only(left: 9, right: 9),
                child: title,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(child: MoveWindow()),
                      const WindowButtons(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      );
    } else {
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
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColors = WindowButtonColors(
        iconNormal: Theme.of(context).iconTheme.color,
        mouseOver: Colors.grey.shade300,
        mouseDown: Colors.grey.shade400,
        iconMouseOver: Colors.black,
        iconMouseDown: Colors.black);

    final closeButtonColors = WindowButtonColors(
      mouseOver: const Color(0xFFD32F2F),
      mouseDown: const Color(0xFFB71C1C),
      iconNormal: Theme.of(context).iconTheme.color,
      iconMouseOver: Colors.white,
    );
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
