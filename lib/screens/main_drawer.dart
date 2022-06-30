import 'package:flutter/material.dart';
import 'package:test_android/screens/BarangScreen.dart';
import 'package:test_android/screens/customerScreen.dart';
import 'package:test_android/screens/transaksiScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(color: Colors.amber),
            child: const Text(
              'Produksi',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.redAccent),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            leading: const Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: const Text(
              'Transaksi',
              style: TextStyle(fontSize: 23),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(CustomerScreen.routeName);
            },
            leading: const Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: const Text(
              'Customer',
              style: TextStyle(fontSize: 23),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(BarangScreen.routeName);
            },
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
            title: const Text(
              'Barang',
              style: TextStyle(fontSize: 23),
            ),
          ),
        ],
      ),
    );
  }
}
