import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:note/configs/setting.dart';
import 'package:note/widgets/home.dart';
import 'package:note/utils/io.dart' as io;
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Setting.init();
  runApp(const App());
  if (io.isDesktop) {
    doWhenWindowReady(() {
      const initialSize = Size(400, 600);
      appWindow.minSize = const Size(300, 450);
      appWindow.size = initialSize;
      appWindow.show();
    });
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Setting(),
      builder: (context, child) {
        final setting = context.watch<Setting>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'note',
          theme: setting.theme,
          initialRoute: '/',
          routes: {'/': (context) => const HomePage()},
        );
      },
    );
  }
}
