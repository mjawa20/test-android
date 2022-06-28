import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class CardItem extends StatelessWidget {
  final String code;
  final String title;
  final String subtitle;
  // final Function deleteTx;
  CardItem({required this.code, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(code),
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: mediaQuery.size.width > 460
            ? TextButton.icon(
                onPressed: () => null,
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => null,
              ),
      ),
    );
    ;
  }
}
