import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class CardItem extends StatelessWidget {
  final String id;
  final String code;
  final String title;
  final String subtitle;
  final Function delete;
  final int? qty;
  // final Function deleteTx;
  CardItem(
      {required this.id,
      required this.code,
      required this.title,
      required this.subtitle,
      required this.delete,
      this.qty});

  void _showDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) {
          return AlertDialog(
            title: const Text("Apakah anda ingin menghapusnya"),
            actions: <Widget>[
              TextButton(
                  onPressed: () => {
                        Navigator.of(ctx).pop(),
                        delete(int.parse(id)),
                      },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text("no"))
            ],
          );
        });
  }

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
        subtitle: Text(qty.toString() + " X " + subtitle),
        trailing: mediaQuery.size.width > 460
            ? TextButton.icon(
                onPressed: () => delete(id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: TextButton.styleFrom(
                  primary: Colors.red,
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => _showDialog(context),
              ),
      ),
    );
  }
}
