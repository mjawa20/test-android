import 'package:flutter/material.dart';

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
              'cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.redAccent),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const ListTile(
            // onTap: () {
            //   Navigator.of(context).pushReplacementNamed('/');
            // },
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: TextStyle(fontSize: 23),
            ),
          ),
          const ListTile(
            // onTap: () {
            //   Navigator.of(context)
            //       .pushReplacementNamed(FiltersScreen.routeName);
            // },
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: TextStyle(fontSize: 23),
            ),
          ),
        ],
      ),
    );
  }
}
