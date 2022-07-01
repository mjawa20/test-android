import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_android/models/barang.dart';
import 'package:test_android/models/customer.dart';
import 'package:test_android/models/sales.dart';
import 'package:test_android/models/salesDets.dart';
import 'package:test_android/services/barang.dart';
import 'package:test_android/services/customer.dart';
import 'package:test_android/services/sales.dart';
import 'package:test_android/widgets/cardItem.dart';
import 'package:intl/intl.dart';
import 'package:test_android/widgets/modalTransaction.dart';
import 'package:test_android/widgets/selectBox.dart';
import 'package:test_android/widgets/summary.dart';

class TransaksiScreen extends StatefulWidget {
  static String routeName = "/transaksi";

  const TransaksiScreen({Key? key}) : super(key: key);

  @override
  State<TransaksiScreen> createState() => _TransaksiScreenState();
}

class _TransaksiScreenState extends State<TransaksiScreen> {
  List<Customer>? _customers;
  List<Barang>? _barangs;
  DateTime? _selectedDate;

  var isLoaded = false;
  int ongkir = 0;
  int diskon = 0;
  int _customerId = 0;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    setState(() {
      isLoaded = false;
    });

    _customers = await CustomerService().getCustomers();
    _barangs = await BarangService().getBarangs();

    if (_customers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  Barang getBarang(int id) {
    return _barangs!.where((element) => element.id == id).first;
  }

  int getId() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  final List<SalesDets> _carts = [];
  void _addNewSales(int diskon, int qty, int barangId) {
    print("===========================================");
    Barang selectBarang = getBarang(barangId);
    double diskonNilai = selectBarang.harga.toDouble() * diskon / 100;
    int hargaDiskon = selectBarang.harga - diskonNilai.round();

    SalesDets newCart = SalesDets(
        id: getId(),
        salesId: 0,
        barangId: barangId,
        hargaBandrol: selectBarang.harga,
        qty: qty,
        diskonPct: diskon,
        diskonNilai: diskonNilai.toInt(),
        hargaDiskon: hargaDiskon,
        total: hargaDiskon * qty);
    print(newCart.id);
    setState(() {
      _carts.add(newCart);
    });
  }

  void handlePost() async {
    if (_customerId == 0 || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Failed!! Customer field and SelectDate is Required")));
      return;
    }
    setState(() {
      isLoaded = false;
    });
    Sales newSales = Sales(
        id: 0,
        kode: '',
        tgl: _selectedDate!,
        mcustomerId: _customerId,
        subtotal: getSubtotal(),
        diskon: diskon,
        ongkir: ongkir,
        totalBayar: total());
    var response = await SalesService.createSales(newSales);
    if (response.statusCode == 200) {
      setState(() {
        _carts.clear();
        isLoaded = true;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Post Success")));
      return;
    }
    print(response.body);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Post Failed")));
  }

  void deleteSales(int id) {
    setState(() {
      _carts.removeWhere((element) => element.id == id);
    });
  }

  void onChangeDiskon(String value) {
    setState(() {
      diskon = int.parse(value);
    });
  }

  void onChangeongkir(String value) {
    setState(() {
      ongkir = int.parse(value);
    });
  }

  int getSubtotal() {
    return _carts.fold(0, (a, b) => a + b.total);
  }

  int total() {
    return getSubtotal() + ongkir - diskon;
  }

  void setValue(Customer e) {
    _customerId = e.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
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
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: isLoaded && _customers!.isNotEmpty
                          ? DropdownScreen(
                              items: _customers!, setValue: setValue)
                          : null),
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(_selectedDate == null
                              ? 'No Choosen date'
                              : 'Date Picked : ${DateFormat.yMd().format(_selectedDate!)}'),
                        ),
                        TextButton(
                          onPressed: _presentDatePicker,
                          child: const Text(
                            'Choose Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Keranjang"),
                      ElevatedButton(
                          onPressed: isLoaded && _customers!.isNotEmpty
                              ? () => showModalBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return NewTransaction(
                                        _addNewSales, _barangs);
                                  })
                              : null,
                          child: const Text("Tambah"))
                    ],
                  ),
                ],
              )),
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
              child: isLoaded && _carts.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          ..._carts.map(
                            (e) => CardItem(
                              id: e.id.toString(),
                              code: getBarang(e.barangId).kode,
                              title: getBarang(e.barangId).nama,
                              subtitle: e.hargaDiskon.toString(),
                              qty: e.qty,
                              delete: deleteSales,
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Summary(
                            subtotal: getSubtotal(),
                            submitPost: handlePost,
                            onChangeDiskon: onChangeDiskon,
                            onChangeOngkir: onChangeongkir,
                            total: total(),
                          )
                        ],
                      ),
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
                            "Keranjang Kosong",
                            style: TextStyle(color: Colors.pink, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
