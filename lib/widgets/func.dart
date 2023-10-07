import 'package:flutter/material.dart';
import 'package:note/widgets/setting.dart';

class FuncBar extends StatelessWidget {
  const FuncBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40.0),
      child: Card(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                showSetting(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
