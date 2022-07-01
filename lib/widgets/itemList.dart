import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_android/widgets/cardItem.dart';

class ItemList extends StatelessWidget {
  final bool isLoaded;
  final List<dynamic>? foundItems;
  final List<dynamic>? customers;
  final Function delete;

  const ItemList(
      {Key? key,
      required this.isLoaded,
      this.customers,
      required this.foundItems,
      required this.delete})
      : super(key: key);
  String getNama(id) {
    return customers!.where((element) => element.id == id).first.nama;
  }

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
        child: isLoaded && foundItems!.isNotEmpty
            ? ListView.builder(
                itemCount: foundItems?.length,
                itemBuilder: (ctx, index) {
                  return CardItem(
                    id: foundItems![index].id.toString(),
                    code: foundItems![index].kode,
                    title: jsonEncode(foundItems![index]).contains("nama")
                        ? foundItems![index].nama
                        : getNama(foundItems![index].mcustomerId),
                    subtitle: jsonEncode(foundItems![index]).contains("telp")
                        ? foundItems![index].telp
                        : jsonEncode(foundItems![index]).contains("harga")
                            ? foundItems![index].harga.toString()
                            : foundItems![index].subtotal.toString(),
                    delete: delete,
                  );
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
