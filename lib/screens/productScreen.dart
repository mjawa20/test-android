import 'package:flutter/material.dart';
import 'package:test_android/models/sales.dart';
import 'package:test_android/widgets/cardItem.dart';

class ProductScreen extends StatefulWidget {
  static String routeName = '/product';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Sales>? sales;
  var isLoaded = false;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: const InputDecoration(
                fillColor: Colors.white,
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
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return CardItem(code: '12', title: 'jawhir', subtitle: '192837');
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.pink,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        )
      ],
    ));
  }
}
