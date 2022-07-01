import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_android/models/barang.dart';
import 'package:test_android/widgets/selectBox.dart';
// import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  final dynamic items;

  const NewTransaction(this.addTx, this.items, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  int _barangId = 0;

  void _submit() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final String enteredTitle = _titleController.text;
    final int enteredAmount = int.parse(_amountController.text);
    if (enteredAmount < 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTx(
      enteredAmount,
      int.parse(enteredTitle),
      _barangId,
    );
    Navigator.of(context).pop();
  }

  void setValue(Barang e) {
    _barangId = e.id;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              DropdownScreen(
                items: widget.items,
                setValue: setValue,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Qty'),
                keyboardType: const TextInputType.numberWithOptions(),
                controller: _titleController,
                onSubmitted: (_) => _submit,
              ),
              TextField(
                maxLength: 2,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: const InputDecoration(labelText: 'Diskon'),
                keyboardType: const TextInputType.numberWithOptions(),
                controller: _amountController,
                onSubmitted: (_) => _submit,
              ),
              ElevatedButton(
                  onPressed: _titleController.text.isEmpty ||
                          _amountController.text.isEmpty
                      ? null
                      : _submit,
                  child: const Text(
                    'Submit',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
