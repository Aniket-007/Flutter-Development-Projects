import 'package:currency_converter/currency_converter_cupertino.dart';
import 'package:currency_converter/current_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(){
  runApp(MyCupertionApp());
}

 class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrentConverterMaterialApp(),
    );
  }

 }


 class MyCupertionApp extends StatelessWidget {
  const MyCupertionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterCupertinoPage(),
    );
  }
}

