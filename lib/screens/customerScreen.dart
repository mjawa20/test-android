import 'package:flutter/material.dart';
import 'package:test_android/models/sales.dart';
import 'package:test_android/widgets/cardItem.dart';

class CustomerScreen extends StatefulWidget {
  static String routeName = '/customer';
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  List<Sales>? sales;
  var isLoaded = false;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Column(
      children: [
        Container(
          child: SizedBox(
            height: 100,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                  border: OutlineInputBorder()),
              controller: _searchController,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return CardItem(id: 12, title: 'jawhir', subtitle: '192837');
            },
          ),
        ),
      ],
    ));
  }
}
