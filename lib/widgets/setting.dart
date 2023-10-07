import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:note/configs/setting.dart';
import 'package:provider/provider.dart';

void showSetting(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: const Text(
        "Settings",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        const SettingWidget(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ),
      ],
    ),
  );
}

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    final setting = context.watch<Setting>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Card(
            child: SwitchListTile(
              value: setting.isLight,
              onChanged: (v) {
                setting.changeTheme(isLight: v);
              },
              title: const Text("Vision Mode"),
              subtitle: const Text('light default'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Card(
            child: SwitchListTile(
              value: setting.isMaterial3,
              onChanged: (v) {
                setting.changeTheme(useMaterial3: v);
              },
              title: const Text("Material 3"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              child: ColorPicker(
                // Use the screenPickerColor as start color.
                color: setting.colorSchemeSeed,
                // Update the screenPickerColor using the callback.
                onColorChanged: (Color color) {
                  print(color);
                  setting.changeTheme(colorSchemeSeed: color);
                },
                width: 30,
                height: 30,
                borderRadius: 10,
                pickersEnabled: const {
                  ColorPickerType.both: false,
                  ColorPickerType.primary: false,
                  ColorPickerType.accent: false,
                  ColorPickerType.custom: true,
                  ColorPickerType.bw: false,
                  ColorPickerType.wheel: false,
                },
                customColorSwatchesAndNames: {
                  ColorTools.createPrimarySwatch(Colors.blue): 'blue',
                  ColorTools.createPrimarySwatch(Colors.green): 'green',
                  ColorTools.createPrimarySwatch(Colors.orange): 'orange',
                  ColorTools.createPrimarySwatch(Colors.purple): 'purple',
                  ColorTools.createPrimarySwatch(Colors.yellow): 'yellow',
                },
                enableShadesSelection: false,
                heading: Text(
                  'Theme Color',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
