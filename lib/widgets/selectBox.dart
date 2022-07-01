import 'package:flutter/material.dart';
import 'package:test_android/models/customer.dart';

class DropdownScreen extends StatefulWidget {
  List<dynamic> items;
  Function setValue;
  DropdownScreen({Key? key, required this.items, required this.setValue})
      : super(key: key);

  @override
  State createState() => DropdownScreenState();
}

class DropdownScreenState extends State<DropdownScreen> {
  dynamic selectedItem;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<dynamic>(
        hint: Text("Select item"),
        value: selectedItem,
        onChanged: (value) {
          setState(() {
            selectedItem = value;
          });
          print("------------------------");
          widget.setValue(selectedItem);
        },
        items: widget.items.map((dynamic user) {
          return DropdownMenuItem<dynamic>(
            value: user,
            child: Row(
              children: <Widget>[
                Text(
                  user.nama,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
