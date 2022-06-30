import 'package:test_android/screens/customerScreen.dart';
import 'package:test_android/screens/historyScreen.dart';
import 'package:test_android/screens/BarangScreen.dart';
import 'package:test_android/screens/tabScreen.dart';

import 'package:flutter/material.dart';
import 'package:test_android/screens/transaksiScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText1: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.pink, accentColor: Colors.amber)),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        HistoryScreen.routeName: (ctx) => const HistoryScreen(),
        CustomerScreen.routeName: (ctx) => const CustomerScreen(),
        BarangScreen.routeName: (ctx) => const BarangScreen(),
        TransaksiScreen.routeName: (ctx) => const TransaksiScreen(),
      },
    );
  }
}
