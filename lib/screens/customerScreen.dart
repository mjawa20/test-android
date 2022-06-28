import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_android/models/customer.dart';
import 'package:test_android/models/sales.dart';
import 'package:test_android/services/customer.dart';
import 'package:test_android/widgets/cardItem.dart';

class CustomerScreen extends StatefulWidget {
  static String routeName = '/customer';
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  List<Customer>? _customers;
  List<Customer>? _foundCustomers;
  var isLoaded = false;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    _customers = await fetchCustomers().getPosts();
    _foundCustomers = _customers;
    if (_customers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Customer>? results;

    if (enteredKeyword.isEmpty) {
      print('asdasda');
      results = _customers;
    } else {
      print('asup');
      results = _customers
          ?.where((element) =>
              element.nama.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundCustomers = results;
    });
  }

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
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                ),
                border: OutlineInputBorder()),
            keyboardType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          replacement: const Expanded(
            flex: 1,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          visible: isLoaded,
          child: Expanded(
            flex: 1,
            child: isLoaded && _foundCustomers!.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundCustomers?.length,
                    itemBuilder: (ctx, index) {
                      return CardItem(
                          code: _foundCustomers![index].kode,
                          title: _customers![index].nama,
                          subtitle: _customers![index].telp);
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.remove_circle_outline,
                        size: 80,
                        color: Colors.pink,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Customer is Empty",
                          style: TextStyle(color: Colors.pink, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
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
