import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_android/models/barang.dart';
import 'package:test_android/screens/main_drawer.dart';
import 'package:test_android/services/barang.dart';
import 'package:test_android/widgets/itemList.dart';
import 'package:test_android/widgets/modal.dart';

class BarangScreen extends StatefulWidget {
  static String routeName = '/barang';
  const BarangScreen({Key? key}) : super(key: key);

  @override
  State<BarangScreen> createState() => _BarangScreenState();
}

class _BarangScreenState extends State<BarangScreen> {
  List<Barang>? _customers;
  List<Barang>? _foundBarangs;
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
    _customers = await BarangService().getBarangs();
    _foundBarangs = _customers;
    if (_customers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void _addNewBarang(String nama, int harga) async {
    final newBarang =
        Barang(id: 0, kode: getRandomString(8), nama: nama, harga: harga);

    var response = await BarangService.createBarang(newBarang);

    if (response.statusCode == 200) {
      _getData();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Success Post")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failde Post")));
    }
  }

  void _deleteBarang(String id) async {
    var response = await BarangService.deleteBarang(id);

    if (response.statusCode == 200) {
      _getData();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Success Delete")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed Delete")));
    }
  }

  void _showAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewBarang);
        });
  }

  void _runFilter(String enteredKeyword) {
    List<Barang>? results;

    if (enteredKeyword.isEmpty) {
      results = _customers;
    } else {
      results = _customers
          ?.where((element) =>
              element.nama.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundBarangs = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          title: const Text('Barang'),
        ),
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
            ItemList(
                isLoaded: isLoaded,
                foundItems: _foundBarangs,
                delete: _deleteBarang),
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
                  onPressed: () {
                    _showAddTransaction(context);
                  },
                ),
              ),
            )
          ],
        ));
  }
}
