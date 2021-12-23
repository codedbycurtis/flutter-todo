import 'package:flutter/material.dart';
import 'package:todo/app.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  final title = "Settings";

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  bool _darkModeEnabled = AppState.darkModeEnabled;

  void _onDarkModeToggled(bool newValue) {
    setState(() {
      _darkModeEnabled = newValue;
      if (_darkModeEnabled) {
        AppState.current?.setDarkTheme();
        return;
      }
      AppState.current?.setLightTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text("Dark Mode"),
              Switch(
                value: _darkModeEnabled,
                onChanged: _onDarkModeToggled,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
