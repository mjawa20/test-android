import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_android/models/customer.dart';
import 'package:test_android/widgets/cardItem.dart';

class ItemList extends StatelessWidget {
  final bool isLoaded;
  final List<dynamic>? foundCustomers;

  ItemList({required this.isLoaded, required this.foundCustomers});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: const Expanded(
        flex: 1,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      visible: isLoaded,
      child: Expanded(
        flex: 1,
        child: isLoaded && foundCustomers!.isNotEmpty
            ? ListView.builder(
                itemCount: foundCustomers?.length,
                itemBuilder: (ctx, index) {
                  return CardItem(
                      code: foundCustomers![index].kode,
                      title: foundCustomers![index].nama,
                      subtitle: foundCustomers![index].telp.isNotEmpty
                          ? foundCustomers![index].telp
                          : foundCustomers![index].harga);
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
    );
  }
}
