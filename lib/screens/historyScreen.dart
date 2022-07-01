import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_android/models/customer.dart';
import 'package:test_android/models/sales.dart';
import 'package:test_android/services/customer.dart';
import 'package:test_android/services/sales.dart';
import 'package:test_android/widgets/itemList.dart';
import 'package:test_android/widgets/selectBox.dart';

class HistoryScreen extends StatefulWidget {
  static String routeName = '/customer';
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Sales>? _sales;
  List<Customer>? _customers = [];
  List<Sales>? _foundHistorys;
  var isLoaded = false;

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  @override
  void initState() {
    _getData();

    super.initState();
  }

  _getData() async {
    setState(() {
      isLoaded = false;
    });
    _sales = await SalesService().getSales();
    _customers = await CustomerService().getCustomers();
    _foundHistorys = _sales;
    if (_sales != null && _customers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void isShowSnackbar(bool res) {
    if (res) {
      _getData();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Success Post")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failde Post")));
    }
  }

  void _deleteHistory(String id) async {
    var response = await SalesService.deleteSales(id);

    isShowSnackbar(response.statusCode == 200);
  }

  void _runFilter(String enteredKeyword) {
    List<Sales>? results;

    if (enteredKeyword.isEmpty) {
      results = _sales;
    } else {
      print('kjhjhj');
    }
    setState(() {
      _foundHistorys = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        ItemList(
            isLoaded: isLoaded,
            foundItems: _foundHistorys,
            delete: _deleteHistory),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
