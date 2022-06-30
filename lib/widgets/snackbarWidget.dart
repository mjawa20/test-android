import 'package:flutter/material.dart';

class SnackbarWidget extends StatelessWidget {
  final String message;

  SnackbarWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(message));
  }
}
