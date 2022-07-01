import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Summary extends StatelessWidget {
  final int subtotal;
  final Function submitPost;
  final Function onChangeDiskon;
  final Function onChangeOngkir;
  final int total;
  const Summary(
      {Key? key,
      required this.subtotal,
      required this.submitPost,
      required this.onChangeDiskon,
      required this.onChangeOngkir,
      required this.total})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text("Subtotal"), Text("Rp " + subtotal.toString())],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Diskon(Rp)"),
            Flexible(
                child: SizedBox(
              width: 100,
              height: 30,
              child: TextField(
                maxLength: 8,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                onChanged: (value) =>
                    onChangeDiskon(value.isEmpty ? 0.toString() : value),
                decoration: const InputDecoration(
                    counterText: "",
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
              ),
            ))
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Ongkir(Rp)"),
            Flexible(
                child: SizedBox(
              width: 100,
              height: 30,
              child: TextField(
                maxLength: 8,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                onChanged: (value) =>
                    onChangeOngkir(value.isEmpty ? 0.toString() : value),
                decoration: const InputDecoration(
                    counterText: "",
                    fillColor: Colors.white,
                    border: OutlineInputBorder()),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
              ),
            ))
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const Text("Total Bayar"), Text("Rp " + total.toString())],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () => submitPost(), child: const Text("Save")),
          ],
        ),
      ],
    );
  }
}
