import 'package:flutter/material.dart';
import 'package:test_android/models/sales.dart';

class HistoryScreen extends StatefulWidget {
  static String routeName = '/history';
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Sales>? sales;
  var isLoaded = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return const Scaffold(
      body: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text('\$asdasd'),
              ),
            ),
          ),
          title: Text(
            'asd',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('asd'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
