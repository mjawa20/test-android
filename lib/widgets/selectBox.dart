import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_android/models/customer.dart';
import 'package:test_android/models/sales.dart';

class SelectBox extends StatefulWidget {
  final List<dynamic>? items;

  SelectBox({required this.items});

  @override
  State<SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<SelectBox> {
  int value = 0;
  String nama = "All";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        isExpanded: true,
        value: value.toString(),
        onChanged: (val) => {
          value = int.parse(val.toString()),
          nama =
              widget.items?.where((element) => element.id == value).first.nama,
        },
        items: widget.items?.map(buildMenuItem).toList(),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(dynamic item) =>
      DropdownMenuItem(value: "asd", child: Text(nama.toString()));
}
