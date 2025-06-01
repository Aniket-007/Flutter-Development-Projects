import 'package:flutter/material.dart';
import 'package:local_database_sqlite/data/local/db_helper.dart';
import 'package:local_database_sqlite/homepage.dart';
import 'package:local_database_sqlite/provider.dart';
import 'package:local_database_sqlite/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DBProvider(dbHelper: DBHelper.getInstance),
        ),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:
          context.watch<ThemeProvider>().getThemeValue()
              ? ThemeMode.dark
              : ThemeMode.light,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Homepage(),
    );
  }
}
