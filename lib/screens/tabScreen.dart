import 'package:test_android/screens/customerScreen.dart';
import 'package:test_android/screens/historyScreen.dart';

import 'package:flutter/material.dart';
import 'package:test_android/screens/main_drawer.dart';
import 'package:test_android/screens/productScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'title': 'Product', 'view': const ProductScreen()},
    {'title': 'Customer', 'view': const CustomerScreen()}
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
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
        ));
  }
}
