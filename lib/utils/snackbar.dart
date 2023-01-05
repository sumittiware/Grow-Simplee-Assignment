import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(
    backgroundColor: Colors.white,
    margin: const EdgeInsets.all(24.0),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    content: Text(
      errorMessage,
      style: const TextStyle(
        fontFamily: 'NunitoBold',
        fontSize: 16,
        color: Colors.red,
      ),
    ),
  );

  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
