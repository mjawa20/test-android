import 'package:flutter/material.dart';
import 'package:test_android/screens/historyScreen.dart';
import 'package:test_android/screens/main_drawer.dart';
import 'package:test_android/screens/transaksiScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'title': 'Transaksi', 'view': const TransaksiScreen()},
    {'title': 'History', 'view': const HistoryScreen()}
  ];
  int _currentIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_currentIndex]['title'])),
      drawer: const MainDrawer(),
      body: _pages[_currentIndex]['view'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Transaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'History'),
        ],
      ),
    );
  }
}
