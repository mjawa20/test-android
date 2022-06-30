import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _submit() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final String enteredTitle = _titleController.text;
    final int enteredAmount = int.parse(_amountController.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
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
              TextField(
                decoration: const InputDecoration(labelText: 'Nama'),
                controller: _titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _submit,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Phone'),
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
