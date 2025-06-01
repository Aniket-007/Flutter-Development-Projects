
import 'package:flutter/material.dart';
import 'package:local_database_sqlite/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting"),),
      body: Consumer<ThemeProvider>(builder: (ctx,provider,__){
        return SwitchListTile.adaptive(
        title: Text("Dark Mode"),
        subtitle: Text("Change theme mode here"),
        value: provider.getThemeValue(), 
        onChanged: (value){
         provider.updateTheme(value: value);
        });
      })
    );
  }
}